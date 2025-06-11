import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("stg") {
            dimension = "flavor-type"
            applicationId = "com.pampa.agilityforex.stg"
            resValue(type = "string", name = "app_name", value = "Agility Forex Stg")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.pampa.agilityforex"
            resValue(type = "string", name = "app_name", value = "Agility Forex")
        }
    }
}