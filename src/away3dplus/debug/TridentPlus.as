package away3dplus.debug {
import away3d.entities.SegmentSet;
import flash.geom.Vector3D;

/**
 * Generates a 3 wireframd grids for x,y,z axes.
 */
public class TridentPlus extends SegmentSet {
	
	/**
	 * Generated wireframe trident with arrows pointing x,y and z axes.
	 * @param	size			Size of trident.
	 * @param	thickness		The thickness of the wireframe lines
	 * @param	showLetters		If false - X,Y,Z letters will not be shown.
	 * @param	showNegative	shows negative part of axis
	 * @param	markGaps		if more then zero - adds marks with specified gaps.
	 * @param	colorX			Color for x axe.
	 * @param	colorY			Color for y axe.
	 * @param	colorZ			Color for z axe
	 */
	public function TridentPlus(size:uint = 100, thickness:Number = 2, showLetters:Boolean = true, showNegative:Boolean = false, markGaps:Number = 0, colorX:uint = 0x0000FF, colorY:uint = 0xFF0000, colorZ:uint = 0x00FF00) {
		super();
		
		var v0:Vector3D = new Vector3D(0, 0, 0);
		var v1:Vector3D;
		var v2:Vector3D;
		var markPosition:Number;
		
		// X arrow
		if (showNegative) {
			v0 = new Vector3D(-size, 0, 0);
		}
		v1 = new Vector3D(size, 0, 0);
		addSegment(new LineSegment(v0, v1, colorX, colorX, thickness));
		v2 = new Vector3D(size - 10, 10, 0);
		addSegment(new LineSegment(v1, v2, colorX, colorX, thickness + 2));
		v2 = new Vector3D(size - 10, 0, 10);
		addSegment(new LineSegment(v1, v2, colorX, colorX, thickness + 2));
		if (markGaps > 0) {
			markPosition = markGaps;
			while (markPosition < size) {
				v1 = new Vector3D(markPosition, -5, 0);
				v2 = new Vector3D(markPosition, 5, 0);
				addSegment(new LineSegment(v1, v2, colorY, colorY, thickness + 2));
				v1 = new Vector3D(markPosition, 0, -5);
				v2 = new Vector3D(markPosition, 0, 5);
				addSegment(new LineSegment(v1, v2, colorY, colorY, thickness + 2));
				if (showNegative) {
					v1 = new Vector3D(-markPosition, -5, 0);
					v2 = new Vector3D(-markPosition, 5, 0);
					addSegment(new LineSegment(v1, v2, colorY, colorY, thickness + 2));
					v1 = new Vector3D(-markPosition, 0, -5);
					v2 = new Vector3D(-markPosition, 0, 5);
					addSegment(new LineSegment(v1, v2, colorY, colorY, thickness + 2));
				}
				markPosition += markGaps;
			}
		}
		
		// Y arrow
		if (showNegative) {
			v0 = new Vector3D(0, -size, 0);
		}
		v1 = new Vector3D(0, size, 0);
		addSegment(new LineSegment(v0, v1, colorY, colorY, thickness));
		v2 = new Vector3D(10, size - 10, 0);
		addSegment(new LineSegment(v1, v2, colorY, colorY, thickness));
		v2 = new Vector3D(0, size - 10, 10);
		addSegment(new LineSegment(v1, v2, colorY, colorY, thickness));
		if (markGaps > 0) {
			markPosition = markGaps;
			while (markPosition < size) {
				v1 = new Vector3D(-5, markPosition, 0);
				v2 = new Vector3D(5, markPosition, 0);
				addSegment(new LineSegment(v1, v2, colorZ, colorZ, thickness + 2));
				v1 = new Vector3D(0, markPosition, -5);
				v2 = new Vector3D(0, markPosition, 5);
				addSegment(new LineSegment(v1, v2, colorZ, colorZ, thickness + 2));
				if (showNegative) {
					v1 = new Vector3D(-5, -markPosition, 0);
					v2 = new Vector3D(5, -markPosition, 0);
					addSegment(new LineSegment(v1, v2, colorZ, colorZ, thickness + 2));
					v1 = new Vector3D(0, -markPosition, -5);
					v2 = new Vector3D(0, -markPosition, 5);
					addSegment(new LineSegment(v1, v2, colorZ, colorZ, thickness + 2));
				}
				markPosition += markGaps;
			}
		}
		
		// Z arrow
		if (showNegative) {
			v0 = new Vector3D(0, 0, -size);
		}
		
		v1 = new Vector3D(0, 0, size);
		addSegment(new LineSegment(v0, v1, colorZ, colorZ, thickness));
		v2 = new Vector3D(10, 0, size - 10);
		addSegment(new LineSegment(v1, v2, colorZ, colorZ, thickness));
		v2 = new Vector3D(0, 10, size - 10);
		addSegment(new LineSegment(v1, v2, colorZ, colorZ, thickness));
		if (markGaps > 0) {
			markPosition = markGaps;
			while (markPosition < size) {
				v1 = new Vector3D(-5, 0, markPosition);
				v2 = new Vector3D(5, 0, markPosition);
				addSegment(new LineSegment(v1, v2, colorX, colorX, thickness + 2));
				v1 = new Vector3D(0, -5, markPosition);
				v2 = new Vector3D(0, 5, markPosition);
				addSegment(new LineSegment(v1, v2, colorX, colorX, thickness + 2));
				if (showNegative) {
					v1 = new Vector3D(-5, 0, -markPosition);
					v2 = new Vector3D(5, 0, -markPosition);
					addSegment(new LineSegment(v1, v2, colorX, colorX, thickness + 2));
					v1 = new Vector3D(0, -5, -markPosition);
					v2 = new Vector3D(0, 5, -markPosition);
					addSegment(new LineSegment(v1, v2, colorX, colorX, thickness + 2));
				}
				markPosition += markGaps;
			}
		}
		
		// letters
		if (showLetters) {
			var scaledLeterParam:Number = size / 10;
			
			// X
			v0 = new Vector3D(size + scaledLeterParam * 2, -scaledLeterParam * 2, scaledLeterParam);
			v1 = new Vector3D(size + scaledLeterParam * 2, scaledLeterParam * 2, -scaledLeterParam);
			addSegment(new LineSegment(v0, v1, colorX, colorX, thickness));
			v0 = new Vector3D(size + scaledLeterParam * 2, -scaledLeterParam * 2, -scaledLeterParam);
			v1 = new Vector3D(size + scaledLeterParam * 2, scaledLeterParam * 2, scaledLeterParam);
			addSegment(new LineSegment(v0, v1, colorX, colorX, thickness));
			
			// Y
			v0 = new Vector3D(0, size + scaledLeterParam * 2, 0);
			v1 = new Vector3D(scaledLeterParam * 2, size + scaledLeterParam * 2, 0);
			addSegment(new LineSegment(v0, v1, colorY, colorY, thickness));
			v1 = new Vector3D(-scaledLeterParam * 2, size + scaledLeterParam * 2, scaledLeterParam);
			addSegment(new LineSegment(v0, v1, colorY, colorY, thickness));
			v1 = new Vector3D(-scaledLeterParam * 2, size + scaledLeterParam * 2, -scaledLeterParam);
			addSegment(new LineSegment(v0, v1, colorY, colorY, thickness));
			
			// Y
			v0 = new Vector3D(scaledLeterParam, scaledLeterParam * 2, size + scaledLeterParam * 2);
			v1 = new Vector3D(-scaledLeterParam, scaledLeterParam * 2, size + scaledLeterParam * 2);
			addSegment(new LineSegment(v0, v1, colorZ, colorZ, thickness));
			v0 = new Vector3D(scaledLeterParam, -scaledLeterParam * 2, size + scaledLeterParam * 2);
			addSegment(new LineSegment(v0, v1, colorZ, colorZ, thickness));
			v1 = new Vector3D(-scaledLeterParam, -scaledLeterParam * 2, size + scaledLeterParam * 2);
			addSegment(new LineSegment(v0, v1, colorZ, colorZ, thickness));
			
		}
	}

}
}
