
/*****************/
/*** CONSTANTS ***/
/*****************/

typedef enum _mode_t
{
  MODE_PWM = 0,                     // PWM mode
  MODE_SQUARE,                      // Square wave mode
  MODE_AWGN                         // AWGN mode
} mode_t;

#define PWM_DLY_MIN     10u         // minimum delay in PWN mode [ms]
#define PWM_DLY_MAX     50u         // maximum delay in PWN mode [ms]
#define PWM_DLY_STEP    2u          // delay variation step in PWN mode [ms]

#define SQR_DLY         20u         // fixed delay in square wave mode [ms]

#define AWGN_DLY_MIN    3u          // delay variation step in PWN mode [ms]
#define AWGN_DLY_MAX    10u



/******************/
/*** PARAMETERS ***/
/******************/

#define BUZZER_PIN  8u              // output pin driving passive buzzer
#define SOUND_MODE  MODE_AWGN     // sound mode



/*****************/
/*** FUNCTIONS ***/
/*****************/

unsigned long update_pwm_dly( void )
{
  static unsigned long dly = PWM_DLY_MIN;
  static bool bForward = true;

  if (bForward)
  {
    if (dly < PWM_DLY_MAX)
    {
      dly += PWM_DLY_STEP;
    }
    else
    {
      dly -= PWM_DLY_STEP;
      bForward = false;
    }
  }
  else
  {
    if (dly > PWM_DLY_MIN)
    {
      dly -= PWM_DLY_STEP;
    }
    else
    {
      dly += PWM_DLY_STEP;
      bForward = true;
    }
  }

  return dly;
}

void setup()
{
  pinMode(BUZZER_PIN, OUTPUT);
}

void loop()
{
  if (MODE_PWM == SOUND_MODE)
  {
    digitalWrite(BUZZER_PIN, LOW);
    delay(update_pwm_dly());
    digitalWrite(BUZZER_PIN, HIGH);
    delay(update_pwm_dly());
  }
  else if (MODE_SQUARE == SOUND_MODE)
  {
    delay(SQR_DLY);
    digitalWrite(BUZZER_PIN, LOW);
    delay(SQR_DLY);
    digitalWrite(BUZZER_PIN, HIGH);
  }
  else if (MODE_AWGN == SOUND_MODE)
  {
    delay(random(AWGN_DLY_MIN,AWGN_DLY_MAX));
    digitalWrite(BUZZER_PIN, random(2));
  }
}
