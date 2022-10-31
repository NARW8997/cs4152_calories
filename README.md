# CalorieManager

  * Yufei Liu yl5099
  * Zeqing Wang zw2856
  * Wenshuo Xie wx2283
  * Ziyu Liu zl3220

## Build, Run, Test Instructions

Ruby version : 2.6.6  
Rails : 4.2.11.3

1. Clone repository
```
$ git clone https://github.com/NARW8997/cs4152_calories.git
```
2. Install Gems

```
$ bundle install --without production
```

3. Create the initial database schema

```
$ bundle exec rake db:migrate
$ bundle exec rake db:test:prepare
```

4. Run test
```
$ bundle exec rspec
```
5. Run server with command:
```
$ rails s -p {enter running port here}
```
