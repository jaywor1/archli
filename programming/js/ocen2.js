let parsed = parseInstruction(input);

for (let i = 0; i < parsed["dronesCount"]; i++) {
    solArr = checkDrone(parsed["drones"][i], parsed["items"]);

    let organic = 0;
    for (value of solArr) {
        if (value) {
            organic++;
        }
    }
    let notOrganic = solArr.length - organic;

    console.log(`DRON ${i}: ${organic} - ${notOrganic}`);
}

function parseInstruction(assigment) {
    const lines = assigment.split('\n');

    const dronesCount = Number(lines[0]);

    let drones = [];
    for (let i = 0; i < dronesCount; i++) {
        let cordinates = lines[i + 1].split(' ');
        drones.push({ x: Number(cordinates[0]), y: Number(cordinates[1]), r: Number(cordinates[2]) });
    }

    const shiftToItems = dronesCount + 1;
    const itemCount = Number(lines[shiftToItems]);

    let items = [];
    for (let i = 1; i < itemCount + 1; i++) {
        let params = lines[shiftToItems + i].split(' ');
        items.push({ x: Number(params[0]), y: Number(params[1]), a: Number(params[2]) });
    }

    return { dronesCount: dronesCount, drones: drones, items: items };
}

function isPrime(num) {
    // unefficient could be better
    
    if (num < 2)
        return false;
    for (let i = num - 1; i > 1; i--) {
        if (num % i == 0) {
            return false;
        }
    }
    return true;
}

function checkDrone(drone, items) {
    let collectedItems = [];

    for (item of items) {
        let x = item["x"] - drone["x"];
        let y = item["y"] - drone["y"];

        if (Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)) < drone["r"]) {
            collectedItems.push(isPrime(item["a"]));
        }
    }

    return collectedItems;
}
