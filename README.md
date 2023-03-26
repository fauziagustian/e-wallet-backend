
## Services
### User Services
* `register` - Creates the customer if not exist
* `login` - Logs in as this customer
* `logout` - Logs out of the current customer
* `balance` - Show User balance of the customer

### Transactions Services
* `topup` - Add this amount to the logged in customer balance
* `withdraw` - Withdraws this amount from the logged in customer
* `transfer` - Transfers this amount from the logged in customer to the target customer
* `history transaction` - History transaction from the logged in customer


## Expected
* `Register`
   Response :
    Registration success
    Hello, Alice!
* `login` 
   Response :
    Hello, Alice!
    Your balance is $0
* `balance` 
   Response :
    Hello, Alice!
    Your balance is $0
* `logout`
   Response :
    Goodbye, Alice!

* `topup`
   Response :
    Topup success!
    Your balance is *any amount that have submitted*
* `withdraw`
   Response :
    Withdraw success!
    Your balance is *any amount*
* `transfer`
   Response :
    Withdraw success!
    Your balance is *any amount*

* `history transaction`
   Response :


## Criteria
* Using Golang framework, feel free to use any framework (gin, echo, etc.)
* Preferably apply the design pattern
* Preferably apply any authentication (token, jwt, Auth User, etc)
* You can use any database (SQL, NoSQL, etc)
* Unit Testing is a plus point


## Collect
* Please submit the test no more than 3 days after receiving this test
* Please zip the test when you have done or you can send the git URL
* Dont forget to give the instructions to run your code using Readme.md 


Running apps :
1. extract this file
2. open folder, and then open cmd type "go install" & "go mod tidy"
3. create db named wallet_service and setup ur env
4. import dummy postgresql (i'm using dbeaver backup)
5. Import POSTMAN API Docs
6. for the user login "fauzi@user.com" pass "fauzi123"
7. for the second user login "agus@user.com" pass "agus123"
8. Login using json payload with email and password
9. u can register with format name,email,password json
10. for the endpoint except login register must be save bearer token from login.
11. the category transaction using table sourc of funds with value (topup, transfer, withdraw)
12. enjoy the program :)