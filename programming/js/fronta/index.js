const express = require("express");

const app = express();

const order_state = {
    rdy: "ready",
    processing: "processing",
    done: "done"
}

let orders = [{id: 0, description: "order0", order_state: order_state.processing }];

let front = [{name: "electronics",lst: orders}];

app.get('/orders', (req,res) => {
    res.send(orders);
});

app.get('/orders/:loc/', (req,res) => {
    let current_orders = front.find(x => x.name == req.params.loc)
    if(current_orders == undefined){
        res.send("location not found");
    }
    res.send(current_orders.lst)
    //res.send(front);
})

app.get('/orders/:loc/:id', (req,res) => {
    let current_orders = front.find(x => x.name == req.params.loc)
    if(current_orders == undefined){
        res.send("location not found");
    }
    let order0 = current_orders.find(x => x.id == req.params.id);
    res.send(order0);

})


app.listen(3000);
console.log("server runnin\'");
