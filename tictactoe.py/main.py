def print_bord_helper(x_value , y_value ,n):
    if x_value == 1:  return 'X'
    elif y_value == 1: return '0'
    else: return n 

def print_bord(x_level , y_level):
    print(f"{print_bord_helper(x_level[0] , y_level[0] , 1)} | {print_bord_helper(x_level[1] , y_level[1] , 2)} | {print_bord_helper(x_level[2] , y_level[2] , 3)} ")
    print(f"--|---|--")
    print(f"{print_bord_helper(x_level[3] , y_level[3] , 4)} | {print_bord_helper(x_level[4] , y_level[4] , 5)} | {print_bord_helper(x_level[5] , y_level[5] , 6)} ")
    print(f"--|---|--")
    print(f"{print_bord_helper(x_level[6] , y_level[6] , 7)} | {print_bord_helper(x_level[7] , y_level[7] , 8)} | {print_bord_helper(x_level[8] , y_level[8] , 9)} ")

def sum(a ,b ,c): return a+b+c 

def declare_winner(x_level , y_level):
    wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] 
    for win in wins:
        if sum(x_level[win[0]] , x_level[win[1]] , x_level[win[2]]) == 3 : 
            print("X win")
            return True

        if sum(y_level[win[0]] , y_level[win[1]] , y_level[win[2]]) == 3 : 
            print("0 win")
            return True
      

if __name__ == "__main__":
    x_level = [0,0,0,0,0,0,0,0,0]
    y_level = [0,0,0,0,0,0,0,0,0]
    turn = 1;

    print("Welcome to the tictacto game.")
    print_bord(x_level , y_level)
    
    count = 0 
    while count < 9:
        n = int(input("X's turn: "))-1;
        x_level[n] = 1
        print_bord(x_level , y_level);
        if declare_winner(x_level , y_level) : break

        n = int(input("O's turn: "))-1;
        y_level[n] = 1
        print_bord(x_level , y_level)
        if declare_winner(x_level , y_level) : break

        count+=1
