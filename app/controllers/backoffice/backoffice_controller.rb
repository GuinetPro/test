module Backoffice
  class BackofficeController < ApplicationController
  	before_filter :authenticate_usuario!
  end
end