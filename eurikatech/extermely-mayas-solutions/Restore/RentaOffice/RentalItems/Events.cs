using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RentalItems
{
    public delegate void ErrorHandler(object sender, EventArgs e);

    public class ErrorEventArgs : EventArgs
    {
        private Exception sourceException;

        public ErrorEventArgs(Exception source)
        {
            sourceException = source;
        }
    }
}
