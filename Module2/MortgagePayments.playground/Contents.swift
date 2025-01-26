import UIKit

func Payment(loanAmount: Int, numOfPayments: Int, interestRate: Float) -> Float {
    var interestDecimal: Float = interestRate / 100
    var amoritization: Float = (interestDecimal * pow(1+interestDecimal, Float(numOfPayments)) / (pow(1+interestDecimal, Float(numOfPayments)) - 1))
    return (Float(loanAmount) * amoritization)
    
}


print(Payment(loanAmount: 20000, numOfPayments: 60, interestRate: (7 / 12)))

