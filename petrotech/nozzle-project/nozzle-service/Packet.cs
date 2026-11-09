using System;
//hani 0933531005
namespace Petrotech
{
    class Packet
    {
        public Packet(byte[] data)
        {
            if(data.Length>=8)
            {
                message=new byte[data.Length-8];
                address=new byte[2];
                command=new byte[2];
                Array.Copy(data, 1, address, 0, 2);
                Array.Copy(data, 3, command, 0, 2);
                Array.Copy(data, 5, message, 0, data.Length-8);
            }
            else
                message=address=command=new byte[0];
        }

        public Packet(byte[] address, byte[] command, byte[] message)
        {
            this.address=address;
            this.command=command;
            this.message=message;
        }

        public byte[] Address
        {
            get
            {
                return address;
            }
            set
            {
                address=value;
            }
        }

        public byte[] Command
        {
            get
            {
                return command;
            }
            set
            {
                command=value;
            }
        }

        public byte[] Message
        {
            get
            {
                return message;
            }
            set
            {
                message=value;
            }
        }

        public string CommandAsString
        {
            get
            {
                return System.Text.Encoding.ASCII.GetString(command).TrimEnd();
            }
        }

        public string MessageAsString
        {
            get
            {
                return System.Text.Encoding.ASCII.GetString(message).TrimEnd();
            }
        }

        public string AddressAsString
        {
            get
            {
                return System.Text.Encoding.ASCII.GetString(address).TrimEnd();
            }
        }

        public byte Checksum
        {
            get
            {
                byte acc=0xff;
                acc-=STX;
                acc-=ETX;
                acc-=address[0];
                acc-=address[1];
                acc-=command[0];
                acc-=command[1];
                for(int i=0; i<message.Length; i++)
                    acc-=message[i];
                
                return (byte)(acc+1);
            }
        }

        public byte[] getBytes()
        {
            byte[] commandBytes=new byte[8+message.Length];
            commandBytes[0]=STX;
            commandBytes[1]=address[0];
            commandBytes[2]=address[1];
            commandBytes[3]=command[0];
            commandBytes[4]=command[1];
            Array.Copy(message, 0, commandBytes, 5, message.Length);
            commandBytes[5+message.Length]=ETX;
            commandBytes[6+message.Length]=Checksum;
            commandBytes[7+message.Length]=EOT;
            return commandBytes;
        }

        public void Print()
        {
            Console.WriteLine(this.ToString());
        }

        public override string ToString()
        {
            return String.Format("Address: {0}, Command: {1}, Message: {2}", AddressAsString, CommandAsString, MessageAsString);
        }

        private const byte STX=0x02;
        private const byte ETX=0x03;
        private const byte EOT=0x04;
        private byte[] address;
        private byte[] command;
        private byte[] message;
    }
}