class AppName
  def initialize(app)
    @app = app 
  end

  def call(env)
    status, headers, response = @app.call(env)
    headers.merge!({'X-App-Name' => 'Notebook API'})
    [status, headers, [response.body]]
    end
end