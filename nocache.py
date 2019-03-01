from flask import make_response
from functools import wraps, update_wrapper
from datetime import datetime

def nocache(view):
    @wraps(view)
    def no_cache(*args, **kwargs):
        response = make_response(view(*args, **kwargs))
        response.headers['Last-Modified'] = datetime.now()
        response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, post-check=0, pre-check=0, max-age=0'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = '-1'
        return response
        
    return update_wrapper(no_cache, view)


#To invoke it, all you need to do is import the function and apply it to your endpoint.
#
#from nocache import nocache
#
#@app.route('/my_endpoint')
#@nocache
#def my_endpoint():
#    return render_template(...)

#----------------------------------------------------------------------------
# Just a minor comment, the date returned in `Last-Modified` is not correct as it is returning the default Python representation (eg `2017-05-01 03:36:09.971337`). The value of this header should use the "HTTP format", eg `Mon, 01 May 2017 03:43:06 GMT`.

# You can use Werkzeug's helper for this:

# from werkzeug.http import http_date

# response.headers['Last-Modified'] = http_date(datetime.now())