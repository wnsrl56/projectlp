package com.project.common;

import org.rosuda.JRI.RMainLoopCallbacks;
import org.rosuda.JRI.Rengine;


public class ReportFromR {

	
	/**
	 * rJAVA Engine 의 인스턴스를 가져옴
	 * @return
	 */
	
	public Rengine getREngine() {
		// just making sure we have the right version of everything
		if (!Rengine.versionCheck()) {
		    System.err.println("** Version mismatch - Java files don't match library version.");
		    System.exit(1);
		}
        System.out.println("Creating Rengine (with arguments)");
        
		// 1) we pass the arguments from the command line
		// 2) we won't use the main loop at first, we'll start it later
		//    (that's the "false" as second argument)
		// 3) the callbacks are implemented by the TextConsole class above

        // 이미 만들어진 R engine이 있는지 확인
		Rengine re= Rengine.getMainEngine();

		if(re == null)
		{
			// 만들어진 인스턴스가 없다면 생성.
			re = new Rengine(null, false, new RMainLoopCallbacks() {
				
				@Override
				public void rWriteConsole(Rengine arg0, String arg1, int arg2) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void rShowMessage(Rengine arg0, String arg1) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void rSaveHistory(Rengine arg0, String arg1) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public String rReadConsole(Rengine arg0, String arg1, int arg2) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public void rLoadHistory(Rengine arg0, String arg1) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void rFlushConsole(Rengine arg0) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public String rChooseFile(Rengine arg0, int arg1) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public void rBusy(Rengine arg0, int arg1) {
					// TODO Auto-generated method stub
					
				}
			});
		}
		
        System.out.println("Rengine created, waiting for R");
		// the engine creates R is a new thread, so we should wait until it's ready
        if (!re.waitForR()) {
            System.out.println("Cannot load R");
            return null;
        }
        
		return re;
	}


}
