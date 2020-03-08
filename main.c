#include <libc.h>

#ifndef TEST
# define TEST "dummy text with number %d \n",15
#endif

static int	ft_abs(int i)
{
	return (i < 0 ? -i : i);
}

static void		putnbr(int n)
{
	unsigned int val;

	if (n < 0)
		write(1,"-",1);
	val = ft_abs(n);
	if (val >= 10)
		putnbr(val / 10);
	char value = val % 10 + '0';
	write(1,&value,1);
}

int main(void)
{
	setvbuf(stdout, NULL, _IONBF, 0);
	write(1, "FT_PRINTF'S RESULT \n", 20);
	int res = ft_printf(TEST);
	write(1,"||",2);
	putnbr(res);
	write(1,"\n",1);
	write(1, "--------------------------------------------------------------------------------\n", 81);
	write(1, "PRINTF'S RESULT \n", 17);
	res = printf(TEST);
	write(1,"||",2);
	putnbr(res);
	write(1,"\n",1);
	write(1, "--------------------------------------------------------------------------------\n", 81);
	return (0);
}
