namespace CustomerCompany
{
    partial class mainFrom
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.company = new System.Windows.Forms.Button();
            this.maxCust = new System.Windows.Forms.TextBox();
            this.customerList = new System.Windows.Forms.ListBox();
            this.balance = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.name = new System.Windows.Forms.TextBox();
            this.enter = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.id = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.isNormal = new System.Windows.Forms.CheckBox();
            this.countSubscribe = new System.Windows.Forms.TextBox();
            this.countNormal = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.idToFind = new System.Windows.Forms.TextBox();
            this.textFromFind = new System.Windows.Forms.TextBox();
            this.find = new System.Windows.Forms.Button();
            this.TSort = new System.Windows.Forms.Button();
            this.BSort = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // company
            // 
            this.company.Location = new System.Drawing.Point(12, 12);
            this.company.Name = "company";
            this.company.Size = new System.Drawing.Size(249, 23);
            this.company.TabIndex = 0;
            this.company.Text = "Click to Create Company , max cust count is";
            this.company.UseVisualStyleBackColor = true;
            this.company.Click += new System.EventHandler(this.company_Click);
            // 
            // maxCust
            // 
            this.maxCust.Location = new System.Drawing.Point(287, 12);
            this.maxCust.Name = "maxCust";
            this.maxCust.Size = new System.Drawing.Size(204, 20);
            this.maxCust.TabIndex = 1;
            // 
            // customerList
            // 
            this.customerList.FormattingEnabled = true;
            this.customerList.Location = new System.Drawing.Point(287, 57);
            this.customerList.Name = "customerList";
            this.customerList.Size = new System.Drawing.Size(204, 108);
            this.customerList.TabIndex = 2;
            // 
            // balance
            // 
            this.balance.Location = new System.Drawing.Point(89, 112);
            this.balance.Name = "balance";
            this.balance.Size = new System.Drawing.Size(173, 20);
            this.balance.TabIndex = 12;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(12, 115);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(67, 13);
            this.label12.TabIndex = 17;
            this.label12.Text = "cust Balance";
            // 
            // name
            // 
            this.name.Location = new System.Drawing.Point(88, 86);
            this.name.Name = "name";
            this.name.Size = new System.Drawing.Size(173, 20);
            this.name.TabIndex = 11;
            // 
            // enter
            // 
            this.enter.Enabled = false;
            this.enter.Location = new System.Drawing.Point(12, 185);
            this.enter.Name = "enter";
            this.enter.Size = new System.Drawing.Size(249, 31);
            this.enter.TabIndex = 16;
            this.enter.Text = "Create Customer";
            this.enter.UseVisualStyleBackColor = true;
            this.enter.Click += new System.EventHandler(this.enter_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 145);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(54, 13);
            this.label1.TabIndex = 10;
            this.label1.Text = "cust Type";
            // 
            // id
            // 
            this.id.Location = new System.Drawing.Point(88, 57);
            this.id.Name = "id";
            this.id.Size = new System.Drawing.Size(173, 20);
            this.id.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 60);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(40, 13);
            this.label2.TabIndex = 13;
            this.label2.Text = "cust Id";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 89);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(57, 13);
            this.label3.TabIndex = 14;
            this.label3.Text = "cust Name";
            // 
            // isNormal
            // 
            this.isNormal.AutoSize = true;
            this.isNormal.Location = new System.Drawing.Point(88, 144);
            this.isNormal.Name = "isNormal";
            this.isNormal.Size = new System.Drawing.Size(118, 17);
            this.isNormal.TabIndex = 18;
            this.isNormal.Text = "is Normal Customer";
            this.isNormal.UseVisualStyleBackColor = true;
            // 
            // countSubscribe
            // 
            this.countSubscribe.Location = new System.Drawing.Point(400, 297);
            this.countSubscribe.Name = "countSubscribe";
            this.countSubscribe.Size = new System.Drawing.Size(91, 20);
            this.countSubscribe.TabIndex = 20;
            // 
            // countNormal
            // 
            this.countNormal.Location = new System.Drawing.Point(400, 271);
            this.countNormal.Name = "countNormal";
            this.countNormal.Size = new System.Drawing.Size(91, 20);
            this.countNormal.TabIndex = 19;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(284, 274);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(97, 13);
            this.label4.TabIndex = 21;
            this.label4.Text = "Normal Cust Count";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(284, 300);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(110, 13);
            this.label5.TabIndex = 22;
            this.label5.Text = "Subscribe Cust Count";
            // 
            // idToFind
            // 
            this.idToFind.Location = new System.Drawing.Point(130, 270);
            this.idToFind.Name = "idToFind";
            this.idToFind.Size = new System.Drawing.Size(132, 20);
            this.idToFind.TabIndex = 24;
            // 
            // textFromFind
            // 
            this.textFromFind.Location = new System.Drawing.Point(15, 296);
            this.textFromFind.Name = "textFromFind";
            this.textFromFind.Size = new System.Drawing.Size(246, 20);
            this.textFromFind.TabIndex = 25;
            // 
            // find
            // 
            this.find.Location = new System.Drawing.Point(15, 270);
            this.find.Name = "find";
            this.find.Size = new System.Drawing.Size(109, 20);
            this.find.TabIndex = 26;
            this.find.Text = "find cust by id";
            this.find.UseVisualStyleBackColor = true;
            this.find.Click += new System.EventHandler(this.find_Click);
            // 
            // TSort
            // 
            this.TSort.Location = new System.Drawing.Point(400, 185);
            this.TSort.Name = "TSort";
            this.TSort.Size = new System.Drawing.Size(91, 31);
            this.TSort.TabIndex = 27;
            this.TSort.Text = "Type Sort";
            this.TSort.UseVisualStyleBackColor = true;
            this.TSort.Click += new System.EventHandler(this.TSort_Click);
            // 
            // BSort
            // 
            this.BSort.Location = new System.Drawing.Point(287, 185);
            this.BSort.Name = "BSort";
            this.BSort.Size = new System.Drawing.Size(91, 31);
            this.BSort.TabIndex = 28;
            this.BSort.Text = "Balance Sort";
            this.BSort.UseVisualStyleBackColor = true;
            this.BSort.Click += new System.EventHandler(this.BSort_Click);
            // 
            // mainFrom
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(503, 347);
            this.Controls.Add(this.BSort);
            this.Controls.Add(this.TSort);
            this.Controls.Add(this.find);
            this.Controls.Add(this.textFromFind);
            this.Controls.Add(this.idToFind);
            this.Controls.Add(this.countSubscribe);
            this.Controls.Add(this.countNormal);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.isNormal);
            this.Controls.Add(this.balance);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.name);
            this.Controls.Add(this.enter);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.id);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.customerList);
            this.Controls.Add(this.maxCust);
            this.Controls.Add(this.company);
            this.Name = "mainFrom";
            this.Text = "CustomerCompany";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button company;
        private System.Windows.Forms.TextBox maxCust;
        private System.Windows.Forms.ListBox customerList;
        private System.Windows.Forms.TextBox balance;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox name;
        private System.Windows.Forms.Button enter;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox id;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckBox isNormal;
        private System.Windows.Forms.TextBox countSubscribe;
        private System.Windows.Forms.TextBox countNormal;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox idToFind;
        private System.Windows.Forms.TextBox textFromFind;
        private System.Windows.Forms.Button find;
        private System.Windows.Forms.Button TSort;
        private System.Windows.Forms.Button BSort;
    }
}

