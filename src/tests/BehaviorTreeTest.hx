package tests;
import hxbt.Behavior;
import hxbt.Behavior.Status;
import hxbt.BehaviorTree;
import hxbt.Sequence;
import tests.BehaviorTreeTest.TreeContext;

/**
 * ...
 * @author Kristian Brodal
 */

 typedef TreeContext = 
 {
	string : String,
	forcedStatus : Status
 }
 
class BehaviorTreeTest
{
	private var m_tree : BehaviorTree;
	
	public function new() 
	{
		m_tree = new BehaviorTree();
		
		var sequence = new Sequence();
		sequence.add(new TestBehavior());
		sequence.add(new TestBehavior());
		sequence.add(new TestBehavior());
		
		m_tree.set(sequence, { string : 'YourNameHere', forcedStatus : Status.SUCCESS } );
	}

	public function update(dt : Float) : Void
	{
		m_tree.update(dt);
	}
}

class TestBehavior extends Behavior
{
	public function new()
	{
		super();
	}
	
	override function onInitialize(context : TreeContext) : Void
	{
		trace('Initialized ${context.string}');
	}
	
	override function onTerminate(context : TreeContext, status : Status) : Void
	{
		trace('Terminated ${context.string}');
	}
	
	override function update(context : TreeContext, dt : Float) : Status
	{
		trace('Updated ${dt}');
		return context.forcedStatus;
	}
}