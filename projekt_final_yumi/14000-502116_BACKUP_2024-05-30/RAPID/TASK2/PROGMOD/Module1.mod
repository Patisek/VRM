MODULE Module1
        CONST robtarget Home_R:=[[341.274942792,15.819826991,173.537032908],[0.707106781,0.707106781,0,0],[-1,1,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Home_R_help_down:=[[341.274942792,15.819826991,150.537032908],[0.707106781,0.707106781,0,0],[-1,1,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_down_help:=[[341.275429936,15.770167607,150.486370455],[1,0,0,0],[-1,0,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_down:=[[341.275429936,-7.229832393,150.486370455],[1,0,0,0],[-1,0,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Home_R_help_back:=[[318.274942792,15.819826991,173.537032908],[0.707106781,0.707106781,0,0],[-1,1,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_back_help:=[[318.275,15.82,173.537],[0.707106781,0,0.707106781,0],[-1,-1,0,4],[101.964426744,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_back:=[[318.225,-7.23,173.537],[0.707106781,0,0.707106781,0],[-1,-1,0,4],[101.964426744,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_down_ACW:=[[341.275429936,-7.229832393,150.486370455],[0.707106781,0,0,-0.707106781],[-1,0,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_down_CW:=[[341.275429936,-7.229832393,150.486370455],[0.707106781,0,0,0.707106781],[-1,0,-1,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Home_R_CW:=[[341.274942792,15.819826991,173.537032908],[0.5,0.5,-0.5,0.5],[-1,1,-1,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Home_R_ACW:=[[341.274942792,15.819826991,173.537032908],[0.5,0.5,0.5,-0.5],[-1,1,2,4],[101.964427132,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_back_CW:=[[318.225,-7.23,173.537],[0.5,0.5,0.5,0.5],[-1,-1,0,4],[101.964426744,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_back_ACW:=[[318.225,-7.23,173.537],[0.5,-0.5,0.5,-0.5],[-1,-1,0,4],[101.964426744,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    !####################################### OBSLUHUJU R D B
    PROC main()
        
        VAR num SizeOfInputArray:=6;
        VAR string input_array{6};
        !input_array:= ["F","F'","F2","F2","R","R'","R2","R2","U","U'","U2","U2","B","B'","B2","B2","L","L'","L2","L2","D","D'","D2","D2","BREAK"]; 
        input_array:= ["B'","L'","D'","B'","D'","BREAK"];
        SetDO DO_L_in_pos,0;SetDO DO_R_in_pos,0;    
        g_Init \maxSpd:=10 \holdForce:=5 \Calibrate;
        g_GripIn;
        g_GripOut;
        !input_array:= ["U","U'","U2","U2","BREAK"];
        
        !PulseDO DO_OPEN_GL;
        PulseDO DO_DETACH_GL;PulseDO DO_DETACH_GR;
                
        
        PulseDO DO_RESET_ENV;
        SetDO DO_L_in_pos,1;
        WaitDO DO_R_in_pos,1;
        WaitTime 1;
        SetDO DO_L_in_pos,0;
        
        g_GripOut;
        WaitTime 5;
        HOME;
        WaitTime 10;
        g_GripIn;
        WaitTime 0.25;
        PulseDO DO_ATTACH_4_GR;
        WaitTime 0.25;
        SetDO DO_L_in_pos,1;
        WaitDO DO_R_in_pos,1;
        WaitTime .5;
        SetDO DO_L_in_pos,0;
        
      FOR i FROM 1 TO SizeOfInputArray DO
        WaitDO DO_R_in_pos,0;
        WaitDI DI_L_in_pos,0;
        TEST input_array{i}
            CASE "U" :      !NENENENEcekej signal####################
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_DOWN;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_3_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                DOWN_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,0;
            CASE "F" :      !NENENENEcekej signal####################
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_BACK;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_5_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                BACK_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,0;
            CASE "B" :      !cekej signal####################
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_BACK;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_5_GR;
                WaitTime 0.25;
                MoveL R_back_CW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_back_CW,-30,0,0),v150,fine,Servo;
                MoveL Offs(R_back,-30,0,0),v150,fine,Servo;
                MoveL R_back,v150,fine,Servo;
                BACK_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,0;
                SetDO DO_L_in_pos,0;
            CASE "L" :      !NENENENEcekej signal####################   NEMELO BY BYT NIC POTREBA
!                g_GripOut;
!                HOME;
!                g_GripIn;
!                SetDO DO_L_in_pos,1;
!                WaitDO DO_R_in_pos,1;
!                g_GripOut;
!                HOME;
!                g_GripIn;
!                SetDO DO_L_in_pos,0;
            CASE "R" :      !cekej signal####################
!                WaitDO DO_R_in_pos,1;
!                g_GripOut;
!                HOME;
!                g_GripIn;
                MoveL Home_R_CW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(Home_R_CW,0,30,0),v150,fine,Servo;
                MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
                MoveL Home_R,v150,fine,Servo;
!                HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
!                SetDO DO_L_in_pos,1;
!                WaitDO DO_R_in_pos,0;
!                SetDO DO_L_in_pos,0;
            CASE "D" :      !cekej signal####################
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_DOWN;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_3_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_CW,0,0,-3),v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_CW,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-3),v150,fine,Servo;
                DOWN_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,0;
                SetDO DO_L_in_pos,0;
            CASE "U2" :
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_DOWN;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_3_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                DOWN_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,0;
            CASE "F2" :
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_BACK;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_5_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                BACK_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,0;
            CASE "B2" :
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_BACK;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_5_GR;
                WaitTime 0.25;
                MoveL R_back_CW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_back_CW,-30,0,0),v150,fine,Servo;
                MoveL Offs(R_back,-30,0,0),v150,fine,Servo;
                MoveL R_back,v150,fine,Servo;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_5_GR;
                WaitTime 0.25;
                MoveL R_back_CW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_back_CW,-30,0,0),v150,fine,Servo;
                MoveL Offs(R_back,-30,0,0),v150,fine,Servo;
                MoveL R_back,v150,fine,Servo;
                BACK_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,0;
                SetDO DO_L_in_pos,0;
            CASE "L2" :
!                g_GripOut;
!                HOME;
!                g_GripIn;
!                SetDO DO_L_in_pos,1;
!                WaitDO DO_R_in_pos,1;
!                g_GripOut;
!                HOME;
!                g_GripIn;
!                SetDO DO_L_in_pos,0;
            CASE "R2" :
!                WaitDO DO_R_in_pos,1;
!                g_GripOut;
!                HOME;
!                g_GripIn;
                MoveL Home_R_CW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(Home_R_CW,0,30,0),v150,fine,Servo;
                MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
                MoveL Home_R,v150,fine,Servo;
!                HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                MoveL Home_R_CW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(Home_R_CW,0,30,0),v150,fine,Servo;
                MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
                MoveL Home_R,v150,fine,Servo;
!                HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
!                SetDO DO_L_in_pos,1;
!                WaitDO DO_R_in_pos,0;
!                SetDO DO_L_in_pos,0;
            CASE "D2" :
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_DOWN;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_3_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_CW,0,0,-3),v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_CW,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-3),v150,fine,Servo;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_3_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_CW,0,0,-3),v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_CW,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-3),v150,fine,Servo;
                DOWN_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,0;
                SetDO DO_L_in_pos,0;
            CASE "U'" :
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_DOWN;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_3_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                DOWN_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,0;
            CASE "F'" :
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_BACK;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_5_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                BACK_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,0;
            CASE "B'" :
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_BACK;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_5_GR;
                WaitTime 0.25;
                MoveL R_back_ACW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_back_ACW,-30,0,0),v150,fine,Servo;
                MoveL Offs(R_back,-30,0,0),v150,fine,Servo;
                MoveL R_back,v150,fine,Servo;
                BACK_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,0;
                SetDO DO_L_in_pos,0;
            CASE "L'" :                 !NENENENEcekej signal####################   NEMELO BY BYT NIC POTREBA
!                g_GripOut;
!                HOME;
!                g_GripIn;
!                SetDO DO_L_in_pos,1;
!                WaitDO DO_R_in_pos,1;
!                g_GripOut;
!                HOME;
!                g_GripIn;
!                SetDO DO_L_in_pos,0;
            CASE "R'" :
!                WaitDO DO_R_in_pos,1;
!                g_GripOut;
!                HOME;
!                g_GripIn;
                MoveL Home_R_ACW,v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(Home_R_ACW,0,30,0),v150,fine,Servo;
                MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
                MoveL Home_R,v150,fine,Servo;
!                HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
!                SetDO DO_L_in_pos,1;
!                WaitDO DO_R_in_pos,0;
!                SetDO DO_L_in_pos,0;
            CASE "D'" :
                WaitDO DO_R_in_pos,1;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                HOME_DOWN;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_3_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_ACW,0,0,-3),v150,fine,Servo;
                g_GripOut;
                WaitTime 0.25;
                PulseDO DO_DETACH_GR;
                WaitTime 0.25;
                MoveL Offs(R_down_ACW,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-26),v150,fine,Servo;
                MoveL Offs(R_down,0,0,-3),v150,fine,Servo;
                DOWN_HOME;
                g_GripIn;
                WaitTime 0.25;
                PulseDO DO_ATTACH_4_GR;
                WaitTime 0.25;
                SetDO DO_L_in_pos,1;
                WaitDO DO_R_in_pos,0;
                SetDO DO_L_in_pos,0;
            CASE "BREAK" :
                BREAK;
        ENDTEST
        
      ENDFOR

        !Add your code here
    ENDPROC
    
    PROC HOME_DOWN()
        MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
        MoveL Offs(Home_R_help_down,0,30,-30),v150,fine,Servo;
        MoveL Offs(R_down_help,0,30,-26),v150,fine,Servo;
        MoveL Offs(R_down,0,0,-26),v150,fine,Servo;
        MoveL Offs(R_down,0,0,-3),v150,fine,Servo;
        !MoveL R_down,v150,fine,Servo;
    ENDPROC    
    PROC From_Home_to_Down()
        MoveL Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_help_down,v150,fine,Servo\WObj:=wobj0;
        MoveL R_down_help,v150,fine,Servo\WObj:=wobj0;
        MoveL R_down,v150,fine,Servo\WObj:=wobj0;
        MoveL R_down_ACW,v150,fine,Servo\WObj:=wobj0;
        MoveL R_down,v150,fine,Servo\WObj:=wobj0;
        MoveL R_down_CW,v150,fine,Servo\WObj:=wobj0;
        MoveL R_down,v150,fine,Servo\WObj:=wobj0;
    ENDPROC
    PROC DOWN_HOME()
        MoveL Offs(R_down,0,0,-10),v150,fine,Servo;
        MoveL Offs(R_down_help,0,30,-20),v150,fine,Servo;
        MoveL Offs(Home_R_help_down,0,30,-30),v150,fine,Servo;        
        MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
        MoveL Home_R,v150,fine,Servo;
    ENDPROC    
    PROC Down_to_home()
        MoveL R_down,v150,fine,Servo\WObj:=wobj0;
        MoveL R_down_help,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_help_down,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_CW,v150,fine,Servo\WObj:=wobj0;
        MoveJ Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_ACW,v150,fine,Servo\WObj:=wobj0;
        MoveJ Home_R,v150,fine,Servo\WObj:=wobj0;
    ENDPROC
    PROC HOME_BACK()
        MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
        MoveL Offs(Home_R_help_back,-30,30,0),v150,fine,Servo;
        MoveJ Offs(R_back_help,-30,30,0),v150,fine,Servo;
        MoveL Offs(R_back,-30,0,0),v150,fine,Servo;
        MoveL R_back,v150,fine,Servo;
    ENDPROC
    PROC From_home_to_back()
        MoveL Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_help_back,v150,fine,Servo\WObj:=wobj0;
        MoveJ R_back_help,v150,fine,Servo\WObj:=wobj0;
        MoveL R_back,v150,fine,Servo\WObj:=wobj0;
        MoveL R_back_CW,v150,fine,Servo\WObj:=wobj0;
        MoveL R_back,v150,fine,Servo\WObj:=wobj0;
        MoveL R_back_ACW,v150,fine,Servo\WObj:=wobj0;
        MoveL R_back,v150,fine,Servo\WObj:=wobj0;
    ENDPROC
    PROC BACK_HOME()
        MoveL Offs(R_back,-30,0,0),v150,fine,Servo;
        MoveL Offs(R_back_help,-30,30,0),v150,fine,Servo;
        MoveJ Offs(Home_R_help_back,-30,30,0),v150,fine,Servo;
        MoveL Offs(Home_R,0,30,0),v150,fine,Servo;
        MoveL Home_R,v150,fine,Servo;
    ENDPROC
    PROC From_back_to_home()
        MoveL R_back,v150,fine,Servo\WObj:=wobj0;
        MoveL R_back_help,v150,fine,Servo\WObj:=wobj0;
        MoveJ Home_R_help_back,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_CW,v150,fine,Servo\WObj:=wobj0;
        MoveJ Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_ACW,v150,fine,Servo\WObj:=wobj0;
        MoveJ Home_R,v150,fine,Servo\WObj:=wobj0;
    ENDPROC
    PROC HOME()
        MoveJ Offs(Home_R,0,300,0),v150,fine,Servo;
        MoveJ Offs(Home_R,0,30,0),v150,fine,Servo;
        MoveL Home_R,v150,fine,Servo;
    ENDPROC
    PROC R_HOME()
        MoveJ Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_ACW,v150,fine,Servo\WObj:=wobj0;
        MoveJ Home_R,v150,fine,Servo\WObj:=wobj0;
        MoveL Home_R_CW,v150,fine,Servo\WObj:=wobj0;
        MoveJ Home_R,v150,fine,Servo\WObj:=wobj0;
    ENDPROC
ENDMODULE