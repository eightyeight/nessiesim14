//-----------------------------------------------------------------------------
// Copyright (c) 2012 GarageGames, LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Data
//-----------------------------------------------------------------------------
uniform mat4 modelview;
uniform vec3 cameraPos, ambient;
uniform vec2 fadeStartEnd;

varying vec4 color;
varying vec2 texCoord;

//-----------------------------------------------------------------------------
// Main
//-----------------------------------------------------------------------------
void main()
{
   gl_Position = modelview * gl_Vertex;
   texCoord = gl_MultiTexCoord0.st;
   color = vec4( ambient.r, ambient.g, ambient.b, 1.0 );

   // Do we need to do a distance fade?
   if ( fadeStartEnd.x < fadeStartEnd.y )
   {

      float distance = length( cameraPos - gl_Vertex.xyz );
      color.a = abs( clamp( ( distance - fadeStartEnd.x ) / ( fadeStartEnd.y - fadeStartEnd.x ), 0.0, 1.0 ) - 1.0 );
   }
}

