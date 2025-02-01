#include "rcsw.h"

// timer update every 20 us
// change it depend on your timer
#define t0_length 20 
#define precision 5

// pulse increment by 1 every  { precision * t0_length } (us) 
// so 1 means 100 (us)

// standard pulse length (us)
#define protocol_pulse_length 350

#define protocol_sync_high 1
#define protocol_sync_low 31

#define protocol_data_one_high 3
#define protocol_data_one_low 1

#define protocol_data_zero_high 1
#define protocol_data_zero_low 3


// 70% more|less approved
#define percent 70
#define tolerance ( protocol_pulse_length * percent / 100 )

// 100 us
#define pulseLength_min ( ( protocol_pulse_length - tolerance ) / ( t0_length * precision ) )
// 700 us
#define pulseLength_max ( ( protocol_pulse_length + tolerance ) / ( t0_length * precision ) + 2 )


#define sync_low_length_min ( pulseLength_min * protocol_sync_low )
#define sync_low_length_max ( pulseLength_max * protocol_sync_low )

void rc_update_port(rcSW *rc,int logic)
{
	#define r (*rc)
    	r.counter = 0;
	if(logic != r.current_state)
	{
		r.current_state = logic;
		switch(r.md)
		{
		case SYNC:
			r.syncL = 0;
			r.syncH = 0;
			r.current_bit = 0;
			if( logic )
			{
				r.md = syncHigh;
			}else{
				//r.md = syncLow;
			}
		break;
		
		case syncHigh:
			if( !logic )
			{
				if( r.syncH >= ( protocol_sync_high * pulseLength_min ) )
				{
					if( r.syncH < ( protocol_sync_high * pulseLength_max ) )
					{
						r.md = syncLow;
					}else{
						r.md = SYNC;
					}		
				}else{
					r.md = SYNC;
				}
			}else{
				r.md = SYNC;
			}
		break;
		
		case syncLow:
			if( logic )
			{
				if( ( r.syncL > sync_low_length_min ) && ( r.syncL < sync_low_length_max ) )
				{
				//sync pulse detect and end
				//start data
				r.data_H = 0;
				r.md = dataH;
				//r.fn(r.name);
				}else{
					r.md = SYNC;
				}
			}else{
				r.md = SYNC;
			}
		break;
		
		case dataH:
		
			if(!logic)
			{
				// count high_pulse time
				if( ( r.data_H > ( protocol_data_zero_high * pulseLength_min ) ) )
				{
					if( r.data_H < ( protocol_data_zero_high * pulseLength_max ) )
					{
						//start 1 high pulse means 0
						r.data_L = 0;
						r.md = dataL;
						// next low pulse should more than 
						//(protocol_data_zero_low * pulseLength_min)
						r.current_data = 0;
					
					}else if( r.data_H <= ( (protocol_data_one_high * pulseLength_max) ) )
					{
						//start 3 high pulse means 1
						r.data_L = 0;
						r.md = dataL;
						// next low pulse should less than 
						//(protocol_data_one_low * pulseLength_max)
						r.current_data = 1;
					}else{
						r.md = SYNC;
					}
				}else{
						r.md = SYNC;
				}
			}else{
				r.md = SYNC;
			}
		
		break;
		
		case dataL:
		
			if( logic )
			{
				if(r.current_data)
				{
					//if data is one
					if( r.data_L < (protocol_data_one_low * pulseLength_max) )
					{
						if( r.data_L > (protocol_data_one_low * pulseLength_min) )
						{
							r.data_H = 0;
							r.md = dataH;
							shift_bit(rc,1);
						}else{
							// fail data
							r.md = SYNC;
						}
					}else{
						// fail data
						r.md = SYNC;
					}
				}else{
					//if data is zero
					if( r.data_L < (protocol_data_zero_low * pulseLength_max) )
					{
						if( r.data_L > (protocol_data_zero_low * pulseLength_min) )
						{
							r.data_H = 0;
							r.md = dataH;
							shift_bit(rc,0);
						}else{
							// fail data
							r.md = SYNC;
						}
					}else{
						// fail data
						r.md = SYNC;
					}
				}

			}else{
				r.md = SYNC;
			}
			
		break;
		}
	}
}


void rc_update_time(rcSW *rc)
{
	#define r (*rc)
	r.counter++;

    	if(r.counter == precision)
	{
		r.counter = 0;

		switch(r.md)
		{
			case syncLow:
				
				r.syncL++;
				
				if(r.syncL > 230)
				{
					r.md = SYNC;
				}
			break;
		
			case syncHigh:
				
				r.syncH++;
				
				if(r.syncH > 20)
				{
					r.md = SYNC;
				}
			break;
			
			case dataH:
			
				r.data_H++;
				
				if(r.data_H > 20)
				{
					r.data_H = 0;
					r.md = SYNC;
				}
				
			break;
			
			case dataL:
			
				r.data_L++;
				
				if(r.data_L > 20)
				{
					if( r.data_H < pulseLength_max )
					{
						// maybe its a sync low pulse
						
						r.current_state = 0;
						r.current_bit = 0;
						r.counter = 0;
						r.syncL = r.data_L;
						r.syncH = r.data_H;
						r.md = syncLow;
						r.data_L = 0;
						r.data_H = 0;
						r.fn(r.name);
					}else{
					
						r.fn(r.name);
						r.syncL = 0;
						r.syncH = 0;
						r.md = SYNC;
						r.data_L = 0;
						r.data_H = 0;
					
					}
				
				}
			
			break;
		}
	}
}

void shift_bit(rcSW *rc,char bt)
{
	#define r (*rc)

	if (r.current_bit < 8) 
	{
		r.data_A = (r.data_A << 1) | bt;
	} else if (r.current_bit < 16) 
	{
		r.data_B = (r.data_B << 1) | bt;
	} else if (r.current_bit < 24) 
	{
		r.data_C = (r.data_C << 1) | bt;
	}
	
	r.current_bit++;
	
	if (r.current_bit >= 24) {
		r.current_bit = 0;
	}
}
