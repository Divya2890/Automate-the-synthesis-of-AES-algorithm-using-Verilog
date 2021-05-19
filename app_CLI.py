import os,sys  
def validate(a):
    if a not in [1,2,3]:
        print("input is invalid")
        print("Please choose an option from below ")
        print(" 1. Change the key used for encryption\n 2. Encrypt data\n 3. Decrypt data\n")
        a=int(input())
        validate(a)
    else:
        return True

def choice():
    print("\nPlease choose an option from below ")
    print(" 1. Change the key used for encryption\n 2. Encrypt data\n 3. Decrypt data\n")
os.system('cmd /k "cls & exit"')   
print("****************************************************************************\n")
print("                   WELCOME TO CRYPTOGRAGHIC WORLD                           \n")
print("****************************************************************************\n\n")
print("Note: This application helps the user to choose his own encryption algorithm\n")
key=None
while True:
    choice()
    a=int(input())
    validate(a)
    if a==1:
        print("please enter the key by wish to encrypt your data")
        key=input()
        os.system('cmd /c "cd c:/iverilog/bin & iverilog -o a.out encryption.v main_tb.v & vvp a.out +key={0}"'.format(key))
        print("Your key is changed sucessfully\n")
    elif a==2:
        print("Enter the data you wish to encrypt")
        data=input()
        if key== None:
            os.system('cmd /c "cd c:/iverilog/bin & iverilog -o a.out encryption.v main_tb.v & vvp a.out +data={0}"'.format(data))
            print("\n")
        else:
            os.system('cmd /c "cd c:/iverilog/bin & iverilog -o a.out encryption.v main_tb_1.v & vvp a.out +data={0} +key={1}"'.format(data,key))
            print("\n")
    else:
        print("Enter the data you wish to decrypt")
        data=input()
        if key== None:
            os.system('cmd /c "cd c:/iverilog/bin & iverilog -o a.out main_decry.v tb_decrypt.v & vvp a.out +encr_data={0}"'.format(data))
            print("\n")
        else:
            os.system('cmd /c "cd c:/iverilog/bin & iverilog -o a.out main_decry.v tb_decrypt_1.v & vvp a.out +encr_data={0} +key={1}"'.format(data,key))
            print("\n")
        



    
