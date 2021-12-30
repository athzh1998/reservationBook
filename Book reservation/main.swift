//
//  main.swift
//  Book reservation
//
//  Created by Atheer Hassan  on 19/05/1443 AH.
//

import Foundation


struct Book {
    var type: String
    var name: String
    var auther: String
    var discription : String
    
    
}

struct User{
    var email:String
    var name: String
}

struct Transaction {
    let uuid = Int.random(in: 1..<10000)
    var user : User
    var bookName : String
    var startDate : String
    var endDate : String
}
var users:[User] = []
var transactions:[Transaction] = []
let books:[Book] = [
    Book(
        type: "Action and Adventure",
        name: "Life of Pi",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Action and Adventure",
        name: "The Three Musketeers",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Action and Adventure",
        name: "The Call of the Wild",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Classics",
        name: "To Kill a Mockingbird",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Classics",
        name: "Little Women",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Classics",
        name: "Beloved",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Detective and Mystery",
        name: "The Night Fire",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Detective and Mystery",
        name: "The Adventures of Sherlock Holmes",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Detective and Mystery",
        name: "And Then There Were None",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Historical Fiction",
        name: "The Help",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Historical Fiction",
        name: "One Hundred Years of Solitude",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Historical Fiction",
        name: "Memoirs of a Geisha",
        auther: "Atheer",
        discription: "Hatoon"),
    Book(
        type: "Horror Hatoon",
        name: "Carrie",
        auther: "Atheer",
        discription: "None"),
    Book(
        type: "Horror",
        name: "The Haunting of Hill House",
        auther: "Hatoon",
        discription: "None"),
    Book(
        type: "Horror",
        name: "Bird Box Hatoon",
        auther: "Atheer",
        discription: "None")
]

var index = "a"
print("Welcome to book reservation application")

repeat{
    
    print("To view the book category, Press V")
    print("To search for a spicific book, Press S")
    print("To manage your reservatuin, Press M")
    print("To close the application, Press X")
    index = String(readLine()!)
    
    switch index {
    case "V":
        print("Choose the book category : ")
        print("1 : Action and Adventure")
        print("2 : Classics")
        print("3 : Detective and Mystery")
        print("4 : Historical Fiction")
        print("5 : Horror")
        print("6 : Show All")
        let category = Int(readLine()!)
        switch category {
        case 1 :
            viewBooks(category: "Action and Adventure")
        case 2 :
            viewBooks(category: "Classics")
        case 3 :
            viewBooks(category: "Detective and Mystery")
        case 4 :
            viewBooks(category: "Historical Fiction")
        case 5 :
            viewBooks(category: "Horror")
        case 6 :
            viewBooks(category: "All")
        default :
            print("Wrong choice")
        }
        
        print("Write your book name to reserve a book or press B to get back the main menu")
        index = String(readLine()!)
        if(index=="b" || index=="B"){
            continue
        }
        else {
            reservationProcess()
        }
    case "S" :
        print("Type the keyword: ")
        let keywork = String(readLine()!)
        search(keyword: keywork)
        print("Write your book name to reserve a book or press B to get back the main menu")
        index = String(readLine()!)
        if(index=="b" || index=="B"){
            continue
        }
        else {
            reservationProcess()
        }
    case "M" :
        print("Enter your email: ")
        let email = String(readLine()!)
        var count=0
        var isItExist = false
        for user in users {
            if(user.email==email){
                isItExist = true
                for transaction in transactions {
                    if (transaction.user.email==email){
                        count+=1
                        print("\(transaction.uuid)- Book: \(transaction.bookName) from: \(transaction.startDate) to: \(transaction.endDate)")
                    }
                    print("Do you want to change end date time? (Y/N)")
                    index=String(readLine()!)
                    if (index=="Y"){
                        print("Enter the transaction ID:")
                        print("Enter the new end date")
                    }
                }
                if (count==0) {
                    print("There is no book reservation for you")
                }
            }
        }
        if (isItExist==false) {
            print("The email is not exist")
            continue
        }
        
    case "X" :
        print("Thank you for using Book reservation application")
        print("See you later")
        break
    default :
        print("Wrong choice")
        continue
    
    }

}while index != "x"



func viewBooks (category : String) {
    if (category=="All") {
        for book in books {
            print("Book name: \(book.name) By \(book.auther)")
            print("------------------------")
        }
    }
    else{
        for book in books {
            if (book.type == category){
                print("Book name: \(book.name) By \(book.auther)")
                print("------------------------")

            }
        }
    }
    
}

func search (keyword : String){
    for book in books {
        if (book.name.contains(keyword) ||
            book.auther.contains(keyword) ||
            book.discription.contains(keyword) ||
            book.type.contains(keyword)) {
            print("Book name: \(book.name) By \(book.auther)")
            print("------------------------")
        }
    }
}

func reservationProcess(){
    print("Detect the first day of reservation peirod by enter day/month/year: ")
    
    print("Start date: ")
    let startDate: String = String(readLine()!)
    print("End date: ")
    let endDate: String = String(readLine()!)
    print("Write your Email: ")
    let email: String = String(readLine()!)
    print("write your Name: ")
    let name: String = String(readLine()!)
    let user = User(email: email, name: name)
    users.append(user)
    transactions.append(Transaction(user: user, bookName: index, startDate: startDate, endDate: endDate))
    
    print("-----------------------------------")
    print("Succefully Reservation Process")
    print("-----------------------------------")
}
