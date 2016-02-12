@ECHO OFF

call git push heroku-pprod master -f
call heroku pg:backups capture --app camouloc
call heroku pg:copy camouloc::DATABASE_URL DATABASE_URL --app camouloc-pprod