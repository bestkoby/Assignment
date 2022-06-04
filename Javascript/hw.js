// 1.
let salaries = {John: 100,Ann: 160,Pete: 130}
let sum = 0;
for (s in salaries){
    sum+=salaries[s]
}
console.log(sum)
console.log(Object.values(salaries).reduce((a,b)=>a+b)) 

// 2.
function multiplyNumeric(obj) {
    for (o in obj){
        if(typeof(obj[o])=='number'){
            obj[o] *= 2
        }
    }    
}
let menu = {width: 200,height: 300,title: "My menu"};
multiplyNumeric(menu);
console.log(menu)

// 3.
function checkEmailId(str){
    var re = /@\w+([\.-]?\w+)*\./;
    return re.test(str)
}
console.log(checkEmailId('1232@.com'))

// 4.
function truncate(str, maxlength) {
    if (str.length>maxlength){
        return str.substr(0, maxlength-1)+'...'
    }else{
        return str
    }
}
console.log(truncate("What I'd like to tell on this topic is:", 20))
console.log(truncate("Hi everyone!", 20))

// 5.
const cars = [ "James","Brennie"];
console.log(cars)
cars.push("Robert")
console.log(cars)
cars[Math.floor(cars.length/2)] = "Calvin"
console.log(cars)
cars.shift()
console.log(cars)
cars.unshift("Rose","Regal")
console.log(cars)
