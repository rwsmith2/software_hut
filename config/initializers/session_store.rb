Rails.application.config.session_store :active_record_store, key: (Rails.env.production? ? '_team9project_session_id' : (Rails.env.demo? ? '_team9project_demo_session_id' : '_team9project_dev_session_id')),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
