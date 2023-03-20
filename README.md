# Microprocessor Design
## Counting ASIC
### Specification
1, Receives three inputs from users, which are...
![image](https://user-images.githubusercontent.com/93663038/226412481-b9b833fa-f93c-48e7-b175-e228be2239c1.png)  
2, Once the start button is hit, unless other button is hit, the value on the count register is increased by '1'  
![image](https://user-images.githubusercontent.com/93663038/226413283-27b891a6-63d0-4981-9c3b-9b36764595e8.png)  
3, We'll be using a 16bit register, so to avoid overflow we gotta detect and reset the value of the count register to 0 when the value equals (1111)16  
4, The processor should stop counting when the stop botton is hit, and might start again when the start botton is hit from where it has left off  
5, The reset botton is to start the counting all over again from '0'  
6, We use a sequential circuit, so we'll use a clock to control the sequence.  

## Kill_go
![image](https://user-images.githubusercontent.com/93663038/226421647-7d36f6d4-7055-4aef-b6ad-7183664b271b.png)  
### Specification
Yet another kind of counting machine, but this time to check if the user didn't abort the active stated machine before the counter counts to '100'  
1, Two interruption from user, one -to get it out of its idle state, two -to abort its active state  -- to activate or to abort  
2, If the user gets to the final state patiently, if he/she stays tight up until the counter reaches '100', a done signal as an output  
3, The state machine gets back to its Idle state if no signal is provided to it -default state == Idle.
