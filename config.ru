require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride

run ApplicationController
use TeachersController
use ExperimentsController
use LabsController
use SessionsController
use StudentsController
use StaticPagesController
