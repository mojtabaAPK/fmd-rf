//Project: remote_receiver.prj
// Device: FT60E21X
// Memory: Flash 1KX14b, EEPROM 128X8b, SRAM 64X8b
// Author: mojtabaAPK t.me/mojtabaAPK
//Company: 
//Version: 1
//   Date: 
//===========================================================
//===========================================================
#include	"SYSCFG.h"
#include	"lib\rcsw.h"

#define t0_value 236

rcSW rc;

volatile char a,b,c;

void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}

void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
			DelayUs(98); //? 1%
		}
	}
}

void PA4_Level_Change_INITIAL(void)
{
	TRISA4 = 1;
	PAIF = 0;
	IOCA4 = 1;
    WPUA4 = 1;
    nPAPU = 0;
	PAIE = 1; 
    PAIF = 0;
}

void t0_init(void)
{
	T0CS = 0;
    PSA = 0;
    PS0 = 0;
    PS1 = 0;
    PS2 = 0;
    
    T0IE = 1;
    T0IF = 0;
    
    TMR0 = t0_value;
}

void interrupt ISR(void)
{

	if(PAIE && PAIF)
	{
		PAIF = 0;
		rc_update_port(&rc,PA4);
	}

	if(T0IE && T0IF)
    {
		T0IF = 0;
        TMR0 = t0_value;
        
        rc_update_time(&rc);
    }
}

void on_rc_receive(char name)
{
	a = rc.data_A;
    b = rc.data_B;
    c = rc.data_C;
    
    
    // check 24 bit data
    // 0010_1111___0111_1111___1011_0001
    // __data_A_____data_B______data_C__
    
    
    if(rc.data_A == 0b00101111 && rc.data_B == 0b01111111 && rc.data_C == 0b10110001 )
    {
		
		PA3 = !PA3;
        rc.data_A = 0;
        rc.data_B = 0;
        rc.data_C = 0;
    }
}

main()
{
	OSCCON = 0B01110000;

    TRISA3 = 0;    
    PA3 = 0;
    
    rc.fn = &on_rc_receive;

    PA4_Level_Change_INITIAL();

    t0_init();

	GIE = 1;

    while(1)
    {
		NOP();
    }
}

