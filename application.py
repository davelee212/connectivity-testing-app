from flask import Flask, render_template
from modules import convert_to_dict

app = Flask(__name__)


@app.route("/")
def start():
    return render_template('homepage.html')


@app.route("/customers")
def customers():
    customer_list = convert_to_dict("customerlist.csv")
    print(customer_list)
    return render_template('customers.html', customers=customer_list)


@app.route('/customer/<num>')
def customer(num):
    customer_list = convert_to_dict("customerlist.csv")
    try:
        customer = customer_list[int(num) - 1]
    except:
        return f"<h1>Invalid value for customer: {num}</h1>"
    # a little bonus function, imported on line 2 above

    return render_template('customerdetails.html', customer=customer)