# Agility Forex project




## Getting Started


## Architecture


## Localization

### How to use localization

## How to test your app
We are using _Mockito_ to mock the objects that you don't need to test.
For running the tests you will need to run:

```
flutter pub run build_runner build //this will create the mock files

flutter test --coverage
```

## Testing and Screenshot with Maestro

use this command line
``maestro test -e SELLCURRENCY=USD -e AMOUNTTOSELL=8500  maestro/exchange.yaml --output ./screenshots``


## DevOps
I added an _Azure Build Pipeline yaml file_ for **Android** and **IOS**. 

## Support






