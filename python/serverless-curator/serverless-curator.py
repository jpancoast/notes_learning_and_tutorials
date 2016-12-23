# serverless-curator.py: An AWS Lambda function.
#
# To run this function in Lambda, you need to bundle all the libraries you use.
# Even something as mundane as:
#   import requests
# won't work by default.
#
# To install a library (like "requests") into your Lambda function, edit
# the requirements.txt in your function's directory, then run:
#
#  lambkin build
#
# The files installed by pip are all "gitignored" by default, so they don't
# get commited. In fact, almost everything is ignored, so if you want to add
# and commit more than just your script, you'll need to explicitly list things
# in "functions/serverless-curator/.gitignore".
#
#
#
# Here is the entry point for Lambda. Execution starts here when an
# event triggers us to run.
#
# Lambda passes us two objects, the event that triggered us, and a 'context'
# object for this execution.

def handler(event, context):
    # To log to Cloudwatch, just:
    print "anything you like."

    optional_return_value = {
        "hello": "World",
        "from": "Python"
    }

    return optional_return_value  # which often becomes a JSON response.
