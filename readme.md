### Гайд по установке



```ruby
bundle install
```

Далее следует установить redis 

```
sudo apt install lsb-release

curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update
sudo apt-get install redis
```

файл workers/parser_worker служит для старта сайдкика и выполнения воркера 

(пока выполнен самый простой сетап)



1. Запускаем сайдкик и воркер командой 
   
   ```ruby
   bundle exec sidekiq -r ./app/workers/parser_worker.rb
   ```

2. Запускаем файл main.rb на исполнение воркера (можно с рубимайна)
   
   ```ruby
   ruby ./app/lib/main.rb
   ```


