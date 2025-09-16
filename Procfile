release: rails db:migrate
test: env DISABLE_SPRING true bundle exec rails db:drop db:create db:schema:load RAILS_ENV=test