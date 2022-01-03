module app;

import board : board;
import mcud.core;

template App()
{
	@setup
	void onSetup()
	{
		// This function will be called on startup
		// It can be deleted if not needed.
	}

	@task
	void onLoop()
	{
		// This function will be called continuously.
		// It can be deleted if not needed.
	}
}
