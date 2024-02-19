# Tennis Refactoring Kata - PHP Version

See the [readme from the original Emily Bache's kata](https://github.com/emilybache/Tennis-Refactoring-Kata) for general
information about this exercise. This is the PHP version of the Tennis Refactoring Kata that uses Pest instead of pure
PHPUnit as the testing suite.

## Installation

The kata uses:

- [PHP 8.3+](https://www.php.net/downloads.php)
- [Composer](https://getcomposer.org)

Recommended:
- [Git](https://git-scm.com/downloads)
- [Docker](https://www.docker.com/)

See [GitHub cloning a repository](https://help.github.com/en/articles/cloning-a-repository) for details on how to 
create a local copy of this project on your computer.

```shell
git clone git@github.com:gpascual/tennis-kata-php.git
```

or

```shell
git clone https://github.com/gpascual/tennis-kata-php.git
```

Install all the dependencies using composer

```shell
composer install
```

or alternatively you can initialize a docker environment and install the dependencies with it by doing

```shell
make init
```

Run all the tests

```shell
composer tests
```

or alternatively (if you initialized the docker environment)

```shell
make composer tests
```

## Dependencies

The kata uses composer to install:

- [Pest](https://github.com/pestphp/pest)
- [PHPMD](https://github.com/phpmd/phpmd)
- [PHP CS Fixer](https://github.com/PHP-CS-Fixer/PHP-CS-Fixer)

## Folders

- `src` - contains the TennisGame interface and three TennisGame classes, which need improving (see
  [the original kata's readme](https://github.com/emilybache/Tennis-Refactoring-Kata) for more information) 
- `tests\Feature` - contains the three corresponding TennisGameTests, one for each class. All the tests are passing, and
  shouldn't need to be changed.

## Testing

PHPUnit is pre-configured to run tests. PHPUnit can be run using a composer script. To run the unit tests, from the
 root of the PHP kata run:

```shell
composer tests
```

Or alternatively:

```shell
make composer tests
```


### Tests with Coverage Report

To run all test and generate a html coverage report run (requires [xdebug](https://xdebug.org/download)):

```shell
composer test-coverage
```

Or alternatively:

```shell
make composer test-coverage
```


The test-coverage report will be created in /builds, it is best viewed by opening **index.html** in your browser.

## Code Standard

Easy Coding Standard (ECS) is used to check for style and code standards, **PSR-12** is used. The current code is not
 upto standard!

### Check Code

To check code, but not fix errors:

```shell
composer check-cs
``` 

Or alternatively:

```shell
make composer check-cs
```

### Fix Code

There are may code fixes automatically provided by ECS, if advised to run --fix, the following script can be run:

```shell
composer fix-cs
```

Or alternatively:

```shell
make composer fix-cs
```

## Static Analysis

PHPStan is used to run static analysis checks.  The current code is not upto standard!

```shell
composer detect-mess
```

Or alternatively:

```shell
make composer detect-mess
```

**Happy coding**!
