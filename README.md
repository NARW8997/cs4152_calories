# CalorieManager

  * Yufei Liu yl5099
  * Zeqing Wang zw2856
  * Wenshuo Xie wx2283
  * Ziyu Liu zl3220

## Build, Run, Test Instructions

Ruby version : 2.6.6  
Rails : 4.2.11.3

1. Clone repository

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
$ rake spec
```
