# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

map 'audricwebdev.com' do
     run Proc.new { |env|
        [200, {'Content-Type' => 'text/html; charset="utf-8"'},
             ['<!DOCTYPE html><html><meta charset="utf-8"><title>It works',
             "</title><b>It works!</b><br /><br />You've reached ",
             'audricwebdev.com'
            ]
        ]
     }
end

map 'www.audricwebdev.com' do
     run Proc.new { |env|
        [200, {'Content-Type' => 'text/html; charset="utf-8"'},
             ['<!DOCTYPE html><html><meta charset="utf-8"><title>It works',
             "</title><b>It works!</b><br /><br />You've reached ",
             'www.audricwebdev.com'
            ]
        ]
     }
end
run Rails.application
