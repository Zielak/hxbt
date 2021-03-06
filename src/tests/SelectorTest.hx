package tests;
import hxbt.Behavior;
import hxbt.Selector;

/**
 * ...
 * @author Kristian Brodal
 */
class SelectorTest
{
	public function new() 
	{
		trace('/----------- SELECTOR TEST -----------/');
		firstFail();
		firstSecondFail();
		allSucceed();
		trace('/--------- END SELECTOR TEST ---------/');
	}
	
	private function firstFail()
	{
		trace('Run / FAILURE / SUCCESS / SUCCESS');
		var s = new Selector();
		s.add(new TestBehavior("0", Status.FAILURE));
		s.add(new TestBehavior("1", Status.SUCCESS));
		s.add(new TestBehavior("2", Status.SUCCESS));
		s.tick(null);
	}
	
	private function firstSecondFail()
	{
		trace('Run / FAILURE / FAILURE / SUCCESS');
		var s = new Selector();
		s.add(new TestBehavior("0", Status.FAILURE));
		s.add(new TestBehavior("1", Status.FAILURE));
		s.add(new TestBehavior("2", Status.SUCCESS));
		s.tick(null);
	}
	
	private function allSucceed()
	{
		trace('Run / SUCCESS / SUCCESS / SUCCESS');
		var s = new Selector();
		s.add(new TestBehavior("0", Status.SUCCESS));
		s.add(new TestBehavior("1", Status.SUCCESS));
		s.add(new TestBehavior("2", Status.SUCCESS));
		s.tick(null);
	}
}

class TestBehavior extends Behavior
{
	public var m_name : String;
	public var m_return : Status;
	
	public function new(name : String, returnStatus : Status)
	{
		super();
		
		m_name = name;
		m_return = returnStatus;
	}
	
	override function onInitialize(context : Dynamic) : Void
	{
		trace('Initialized ${m_name}');
	}
	
	override function onTerminate(context : Dynamic, status : Status) : Void
	{
		trace('Terminated ${m_name}');
	}
	
	override function update(context : Dynamic) : Status
	{
		trace('Updated ${m_name}');
		return m_return;
	}
}