from flask import render_template, Flask, request
from flaskapp import app
import stripe


stripe_keys = {
  'publishable_key':'pk_test_E1TZeb916WOIUzkphxzZx0jp00PTws2Lfq',
  'secret_key': 'sk_test_DSkbzz55upn769yEDYDtbrOs00fGZor5MK'
}

stripe.api_key = stripe_keys['secret_key']


@app.route('/')
@app.route('/index')
@app.route('/menu')
def index():
    return render_template('index.html', title='Home')


@app.route('/charge', methods=['POST'])
def charge():
    # Amount in cents
    amount = price
    customer = stripe.Customer.create(
        email='customer@example.com',
        source=request.form['stripeToken']
    )

    charge = stripe.Charge.create(
        customer=customer.id,
        amount=amount,
        currency='usd',
        description='Flask Charge'
    )

    return render_template('charge.html', amount=amount)


@app.route('/order')
def order():
    return render_template('order.html', key=stripe_keys['publishable_key'])


@app.route('/task', methods=['POST'])
def task():
    if request.method == 'POST':
        try:
            global price
            price = request.form['price']
        finally:
            return render_template('order.html',key = stripe_keys['publishable_key'], price=price)
