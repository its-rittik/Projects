import mysql.connector

connection = mysql.connector.connect(host ='localhost' , username = 'root' , password = 'root' , database = 'TicTacToe')
my_cursor = connection.cursor()



def print_bord_helper(player1EnteredValue , player2EnteredValue ,n):
    if player1EnteredValue == 1:  return player1[0]
    elif player2EnteredValue == 1: return player2[0]
    else: return n 

def print_bord(player1Values ,player2Values):
    print(f"{print_bord_helper(player1Values[0] ,player2Values[0] , 1)} | {print_bord_helper(player1Values[1] ,player2Values[1] , 2)} | {print_bord_helper(player1Values[2] ,player2Values[2] , 3)} ")
    print(f"--|---|--")
    print(f"{print_bord_helper(player1Values[3] ,player2Values[3] , 4)} | {print_bord_helper(player1Values[4] ,player2Values[4] , 5)} | {print_bord_helper(player1Values[5] ,player2Values[5] , 6)} ")
    print(f"--|---|--")
    print(f"{print_bord_helper(player1Values[6] ,player2Values[6] , 7)} | {print_bord_helper(player1Values[7] ,player2Values[7] , 8)} | {print_bord_helper(player1Values[8] ,player2Values[8] , 9)} ")

def sum(a ,b ,c): return a+b+c 

def declare_winner(player1Values ,player2Values):
    wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
    for win in wins:
        if sum(player1Values[win[0]] , player1Values[win[1]] , player1Values[win[2]]) == 3 : 
            print(player1 + " wins")
            return True

        if sum(player2Values[win[0]] ,player2Values[win[1]] ,player2Values[win[2]]) == 3 : 
            print(player2 + " wins")
            return True
      

if __name__ == "__main__":
    player1Values = [0,0,0,0,0,0,0,0,0]
    player2Values = [0,0,0,0,0,0,0,0,0]

    print("Welcome to the tictacto game.")
    print_bord(player1Values ,player2Values)
    
    player1 = input('First player name :')
    player2 = input("Secound player name :")


    count = 0 
    while count < 9:
        
        n = int(input(player1+" 's turn: "))-1
        player1Values[n] = 1
        print_bord(player1Values ,player2Values)
        if declare_winner(player1Values ,player2Values) : break

        
        n = int(input(player2+" 's turn: "))-1

        s = 'INSERT INTO score_board values(%s,%s)'
        t = (player1 , player2)

        ##my_cursor.execute(s,t)
        ##connection.commit()

        player2Values[n] = 1
        print_bord(player1Values ,player2Values)
        if declare_winner(player1Values ,player2Values) : break

        count+=1
