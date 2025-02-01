#ifndef RCSW_H
#define RCSW_H

typedef enum Mode
{
	SYNC,
    syncHigh,
    syncLow,
    
    dataL,
    dataH
    
};


typedef struct
{
	enum Mode md;
    
    char name;

	int counter;

	int current_state;
    
	char syncH;
	char syncL;
    
    char data_H;
    char data_L;
    
    char data_A;
    char data_B;
    char data_C;

    int current_data;
    
	char current_bit;
    
    void (*fn)(char name);

} rcSW;

#endif



void rc_update_port(rcSW *rc,int logic);
void rc_update_time(rcSW *rc);
void shift_bit(rcSW *rc,char bt);