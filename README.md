# Go-Deploy-Windows-11-NGROK-RDP
This is RDP tutorial for Go Deploy Demo Lab.

Demo Lab with Windows 11 VM: https://lms.godeploy.it/DemoLabs/Register

Step 1: Fill in your information and lauch lab.

<img width="650" alt="image" src="https://user-images.githubusercontent.com/58414694/190913898-0dbef37e-9f7a-47a8-92b5-1187764ea6e7.png">


Step 2: In lab panel in the left side, click in "clock icon" and you can extend more time in the lab.

<img width="259" alt="image" src="https://user-images.githubusercontent.com/58414694/190914065-93d44ed7-786e-4232-994a-ac3cbbab20d2.png">


Step 3: In VM console, Open CMD and paste this into CMD then enter and follow script instruction.

 ```console  
cmd /c curl -LkO https://github.com/kmille36/Go-Deploy-Windows-11-NGROK-RDP/raw/main/godeployrdp.bat && cmd /c ngrokchoice.bat

```

<img width="1079" alt="image" src="https://user-images.githubusercontent.com/58414694/190914201-59ceaea3-bccc-47ae-9b72-eee4404e17f7.png">

Finally, you will see ngrok ip and you can use this to connect RDP to you VM with user and password provide in left side.

<img width="1077" alt="image" src="https://user-images.githubusercontent.com/58414694/190914400-dc25f0f7-f01b-4574-b577-2850dbda50e9.png">


