# decidim-k8s

Free Open-Source participatory democracy, citizen participation and open government for cities and organizations

This is the open-source repository for decidim-k8s, based on [Decidim](https://github.com/decidim/decidim).

## Setting up the application

You will need to do some steps before having the app working properly once you've deployed it:

1. Open a Rails console in the server: `bundle exec rails console`
2. Create a System Admin user:
```ruby
user = Decidim::System::Admin.new(email: <email>, password: <password>, password_confirmation: <password>)
user.save!
```
3. Visit `<your app url>/system` and login with your system admin credentials
4. Create a new organization. Check the locales you want to use for that organization, and select a default locale.
5. Set the correct default host for the organization, otherwise the app will not work properly. Note that you need to include any subdomain you might be using.
6. Fill the rest of the form and submit it.

You're good to go!

## Setting up the Docker config

- Build the Docker containers with the docker-compose config 
```shell script
docker-compose up
```
- Check that the containers are correctly started
```shell script
docker-compose logs
```
- Create database and run migrations
```shell script
docker-compose exec app bundle exec rake db:setup db:migrate
```
- Go to http://localhost:3000


To shutdown containers, run 
```shell script
docker-compose down
```
If you need to access to the Rails console, run 
```shell script
docker-compose exec app bundle exec rails c
```
If a change is made in the Gemfile, it is necessary to delete the Docker volume and reload the docker-compose configuration
```shell script
docker volume prune
docker-compose up
```
