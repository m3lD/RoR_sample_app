source 'https://rubygems.org'

gem 'rails',                    '4.2.0'
gem 'bcrypt',                   '3.1.7'                 # Gema que crea hash en las passwords
gem 'bootstrap-sass',           '3.3.1'                 # Gema para bootstrap
gem 'sass-rails',               '~> 4.0.3'              # Gema para preprocesador sass
gem 'uglifier',                 '>= 1.3.0'              # UglifyJS compresar JavaScript
gem 'coffee-rails'                                      
gem 'jquery-rails'
gem 'turbolinks'                                        # Gema que mejora el rendimiento de los enlaces no permite la recompilacion de CSS y JS.
gem 'jbuilder',                 '~> 2.0'                
gem 'sdoc',                     '0.4.0', group: :doc    # Generador de documentación
gem 'faker',                    '1.4.2'                 # Gema que genera datos falsos para testeo
gem 'will_paginate'                                     # Paginador
gem 'bootstrap-will_paginate'                           # Estilo de Bootstrap para paginador                            
gem 'carrierwave',             '0.10.0'                 # Gema que facilita la subida de archivos
gem 'mini_magick',             '3.8.0'                  # Contenedor para ImageMagick
gem 'fog'                                               # https://github.com/fog/fog

group :development, :test do
  gem 'byebug',      '3.4.0'                            # Herramienta para debugging
  gem 'web-console'                                     
  gem 'spring'                                          # Prealoader para la aplicacion mejora el rendimiento entre tareas de testing.
  gem 'sqlite3'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
  gem 'pg',             '0.17.1'                        # Gema de PostgreSQL
  gem 'rails_12factor', '0.0.2'                         # Facilita el deploy en Heroku
end

