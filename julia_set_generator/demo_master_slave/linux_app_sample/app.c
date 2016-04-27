#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>
#include <time.h>
#include <unistd.h>

#include "PCIE.h"

#define NUMARGS 4

//MAX BUFFER FOR DMA
#define MAXDMA 16

//BASE ADDRESS FOR CONTROL REGISTER
//#define CRA 0x00004080		// This is the starting address of the Custom Slave module. This maps to the address space of the custom module in the Qsys subsystem.
#define CRA 0x00000000		// This is the starting address of the Custom Slave module. This maps to the address space of the custom module in the Qsys subsystem.

//BASE ADDRESS TO SDRAM
#define SDRAM 0x08000000	// This is the starting address of the SDRAM controller. This maps to the address space of the SDRAM controller in the Qsys subsystem.
#define START_BYTE 0xF00BF00B
#define STOP_BYTE 0xDEADF00B
#define RWSIZE (32 / 8)
PCIE_BAR pcie_bars[] = { PCIE_BAR0, PCIE_BAR1 , PCIE_BAR2 , PCIE_BAR3 , PCIE_BAR4 , PCIE_BAR5 };

void test32( PCIE_HANDLE hPCIe, DWORD addr );
void testDMA( PCIE_HANDLE hPCIe, DWORD addr);
void runCustomLogic( PCIE_HANDLE hPCIe, DWORD addr,float a,float b);
DWORD float2fxpt(float x);

int main(int argc, char * argv[])
{
	void *lib_handle;
	PCIE_HANDLE hPCIe;

	lib_handle = PCIE_Load();		// Dynamically Load the PCIE library
	if (!lib_handle)
	{
		printf("PCIE_Load failed\n");
		return 0;
	}
	hPCIe = PCIE_Open(0,0,0);		// Every device is a like a file in UNIX. Opens the PCIE device for reading/writing

	if (!hPCIe)
	{
		printf("PCIE_Open failed\n");
		return 0;
	}

	if(argc != 3){
		printf("usage: ./app <a int> <b int>");
		return 1;
	}
	runCustomLogic(hPCIe, CRA, atof(argv[1]), atof(argv[2]));
	/*
	//test CRA
	test32(hPCIe, CRA);			// Test the Configuration Registers for reads and writes
	PCIE_Write32( hPCIe, pcie_bars[0], CRA, START_BYTE);
	//test SDRAM
	testDMA(hPCIe,SDRAM);			// Test the SDRAM for reads and writes

	PCIE_Write32( hPCIe, pcie_bars[0], CRA, STOP_BYTE);
	printf("\nPush up SW[16] to view data stored in SDRAM and use SW[3:0] to select different addresses.\n");
*/
	return 0;
}
//runs custom logic
void runCustomLogic(PCIE_HANDLE hPCIe, DWORD addr, float a, float b){
	BOOL bPass;
	DWORD args[NUMARGS];
	DWORD readVal;
	int i;
	printf("%d\n",(int)(a));
	args[0] = (DWORD)((int)a);
	args[1] = float2fxpt(a);
	args[2] = (DWORD)((int)b);
	args[3] = float2fxpt(b);
	
	for(i = 0;i < NUMARGS;i++){
		bPass = PCIE_Write32( hPCIe, pcie_bars[0], addr+(4*i), args[i]);
		if (!bPass){
			printf("test FAILED: write did not return success");
			return;
		}

		bPass = PCIE_Read32( hPCIe, pcie_bars[0], addr+(4*i), &readVal);
		if (!bPass)
		{
			printf("test FAILED: read did not return success");
			return;
		}
		printf("wrote register %d at addr %x with value %x: ", i, addr+(4*i), args[i]);
		printf("expected %x, received %x\n", args[i], readVal);
	}

	sleep(1);

	bPass = PCIE_Read32( hPCIe, pcie_bars[0], addr+(15), &readVal);
	if (!bPass){
		printf("test FAILED: read did not return success");
		return;
	}
	printf("testing complete flag %x: ", readVal);
	return;
}

DWORD float2fxpt(float x){
    int x_int = (int)x;
    float x_fp = x-x_int;
    
    //printf("%d",x_int);
    int i;
    int tmp = 0;
    
    for(i=0;i<11;i++){
        x_fp*=2;
        tmp*=2;
        if(x_fp >=1){
            tmp++;
        }
        x_fp-=(int)x_fp;
        
    }
    //printf("%d",tmp);
    DWORD ret = (DWORD)tmp;
    return ret;
}

//Tests 16 consecutive PCIE_Write32 to address

void test32( PCIE_HANDLE hPCIe, DWORD addr )
{
	BOOL bPass;
	DWORD testVal = 0xf;
	DWORD readVal;

	WORD i = 0;
	for (i = 0; i < 16 ; i++ )
	{
		bPass = PCIE_Write32( hPCIe, pcie_bars[0], addr, testVal);
		if (!bPass)
		{
			printf("test FAILED: write did not return success");
			return;
		}
		bPass = PCIE_Read32( hPCIe, pcie_bars[0], addr, &readVal);
		if (!bPass)
		{
			printf("test FAILED: read did not return success");
			return;
		}
		printf("Testing register %d at addr %x with value %x: ", i, addr, testVal);

		if (testVal == readVal)
		{
			printf("Test PASSED: expected %x, received %x\n", testVal, readVal);
		}
		else
		{
			printf("Test FAILED: expected %x, received %x\n", testVal, readVal);
		}
		testVal = testVal + 1;
		addr = addr + 4;
	}
	return;
}

//tests DMA write of buffer to address
void testDMA( PCIE_HANDLE hPCIe, DWORD addr)
{
	BOOL bPass;
	DWORD testArray[MAXDMA];
	DWORD readArray[MAXDMA];
	
	WORD i = 1;
	testArray[0] = START_BYTE;
	while ( i < MAXDMA )
	{
		testArray[i] = i  + 0x0f;
		i++;
	}

	//bPass = PCIE_DmaWrite(hPCIe, addr, testArray, MAXDMA * RWSIZE );
	//if (!bPass)
	//{
	//	printf("test FAILED: write did not return success");
	//	return;
	//}
	bPass = PCIE_DmaRead(hPCIe, addr, readArray, MAXDMA * RWSIZE );
	if (!bPass)
	{
		printf("test FAILED: read did not return success");
		return;
	}
	i = 0;
	while ( i < MAXDMA )
	{
		printf("Testing SDRAM at addr %x: ", addr);
		if (testArray[i] == readArray[i])
		{
			printf("Test PASSED: expected %x, received %x\n", testArray[i], readArray[i]);
		}
		else
		{
			printf("Test FAILED: expected %x, received %x\n", testArray[i], readArray[i]);
		}
		i++;
		addr = addr + 4;
	}
	return;
}
