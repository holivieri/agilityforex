import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

import '../../main.dart';
import '../routes/routes.dart';
import '../utils/colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late final NotificationsBloc bloc;

  @override
  void initState() {
    super.initState();
    final NotificationsService notificationService = NotificationsService(
      Client(),
    );
    final NotificationsRespository notificationsRespository =
        NotificationsRespository(notificationService);

    bloc = NotificationsBloc(notificationsRespository)
      ..add(GettingUserNotifications());
  }

  @override
  Widget build(BuildContext context) {
    return getMyNotifications();
  }

  Widget getMyNotifications() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: platformIsNotWeb() ? 10 : 25,
            ),
            child: SectionHeader(
              title: AppLocalizations.of(context)!.myNotifications,
              seeAll: false,
            ),
          ),
          BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, status) {
              if (status is LoadingNotifications) {
                return const Center(child: CircularProgressIndicator());
              } else if (status is NotificationsLoaded) {
                if (status.notifications.isNotEmpty) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: status.notifications.length,
                      itemBuilder: (_, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            color: themeDanger,
                            child: const Icon(
                              Icons.delete_forever,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (DismissDirection direction) {
                            debugPrint(status.notifications[index].id);
                            bloc.add(
                              DeletingNotification(
                                status.notifications[index].id,
                              ),
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                Routes.notificationDetailsRoute,
                                pathParameters: {
                                  'id': status.notifications[index].id,
                                },
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 10,
                              child: ListTile(
                                leading: const Icon(FontAwesomeIcons.envelope),
                                title: Text(
                                  status.notifications[index].title,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                subtitle: Text(
                                  status.notifications[index].message,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(AppLocalizations.of(context)!.noNotifications),
                  );
                }
              } else {
                return const SizedBox(height: 200, width: 200);
              }
            },
          ),
        ],
      ),
    );
  }
}
