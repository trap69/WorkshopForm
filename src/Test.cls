 
 /*------------------------------------------------------------------------
    File        : Test
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Arnoldas
    Created     : Mon Feb 07 11:01:44 EET 2022
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Test INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE bindingSource1 AS Progress.Data.BindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE CustomerListBox AS System.Windows.Forms.ListBox NO-UNDO.
    DEFINE PRIVATE VARIABLE CustomerOrdersBox AS System.Windows.Forms.ListBox NO-UNDO.
    DEFINE PRIVATE VARIABLE linenumDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE itemnumDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE extendedPriceDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE discountDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE NameTextBox AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE DeleteButton AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE OrderDataGridView AS System.Windows.Forms.DataGridView NO-UNDO.
    DEFINE PRIVATE VARIABLE qtyDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE priceDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE ordernumDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE orderLineStatusDataGridViewTextBoxColumn AS System.Windows.Forms.DataGridViewTextBoxColumn NO-UNDO.
    DEFINE PRIVATE VARIABLE SalesRepLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE SaveButton AS System.Windows.Forms.Button NO-UNDO.
    
define buffer  bCustomer for Customer.
        
    CONSTRUCTOR PUBLIC Test (  ):
        
        
        SUPER().
        InitializeComponent().
        LoadData ().
        LoadData ('Test').
        
        
        THIS-OBJECT:ComponentsCollection:ADD(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.
    
    CONSTRUCTOR PUBLIC Test ( input test as integer ):
        
        
        SUPER().
        InitializeComponent().
        THIS-OBJECT:ComponentsCollection:ADD(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.
    
    
    
	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/

    method public void getOrders (input customerNum as integer ):

        DEFINE VARIABLE qh AS HANDLE NO-UNDO.
        CREATE query qh.
        qh:SET-BUFFERS (buffer OrderLine:Handle).
        qh:QUERY-PREPARE ("FOR EACH OrderLine WHERE Ordernum = " + string (customerNum)).
        qh:QUERY-OPEN ().
        bindingSource1:Handle = qh.

    end method.
    
    
	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID DeleteButton_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
		find Customer
             where Customer.Name = string(CustomerListBox:SelectedItem)
             exclusive-lock.
             
        delete Customer.
        
        NameTextBox:Text = ''.
        
        CustomerListBox:Items:Clear().
        
        LoadData().
		
		RETURN.

	END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    METHOD PRIVATE VOID CustomerListBox_DoubleClick( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        
        MESSAGE 'Hello World'
        VIEW-AS ALERT-BOX.
        
        RETURN.

    END METHOD.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID CustomerListBox_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
		
		
		find bCustomer
             where bCustomer.Name = string(CustomerListBox:SelectedItem)
             no-lock.
             
          getOrders(bCustomer.CustNum).   
          
          find OrderLine 
          where OrderLine.Ordernum = bCustomer.customerNum
          no-lock.
              
           CustomerOrdersBox:Items:Add = getOrders(OrderLine). 
/*        find OrderLine                                   */
/*             where OrderLine.Ordernum = bCustomer.CustNum*/
/*             no-lock.                                    */
             
        
/*        SalesRepLabel:Text = OrderLine.Ordernum.*/
        
/*        CustomerOrders:Text = OrderLine.Linenum.*/
           
            
/*                                                        */
/*            find SalesRep                               */
/*            where Salesrep.SalesRep = bCustomer.SalesRep*/
/*            no lock.                                    */
/*            CustomerOrdersBox:text = Salesrep.SalesRep  */
            

        
        RETURN.


	END METHOD.

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:components = NEW System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc1 = NEW Progress.Data.TableDesc("OrderLine").
        THIS-OBJECT:CustomerListBox = NEW System.Windows.Forms.ListBox().
        THIS-OBJECT:SalesRepLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:SaveButton = NEW System.Windows.Forms.Button().
        THIS-OBJECT:DeleteButton = NEW System.Windows.Forms.Button().
        THIS-OBJECT:NameTextBox = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:OrderDataGridView = NEW System.Windows.Forms.DataGridView().
        THIS-OBJECT:ordernumDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:discountDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:extendedPriceDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:itemnumDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:linenumDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:orderLineStatusDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:priceDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:qtyDataGridViewTextBoxColumn = NEW System.Windows.Forms.DataGridViewTextBoxColumn().
        THIS-OBJECT:bindingSource1 = NEW Progress.Data.BindingSource(THIS-OBJECT:components).
        THIS-OBJECT:CustomerOrdersBox = NEW System.Windows.Forms.ListBox().
        CAST(THIS-OBJECT:OrderDataGridView, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* CustomerListBox */
        /*  */
        THIS-OBJECT:CustomerListBox:FormattingEnabled = TRUE.
        THIS-OBJECT:CustomerListBox:Location = NEW System.Drawing.Point(12, 12).
        THIS-OBJECT:CustomerListBox:Name = "CustomerListBox".
        THIS-OBJECT:CustomerListBox:Size = NEW System.Drawing.Size(120, 95).
        THIS-OBJECT:CustomerListBox:TabIndex = 0.
        THIS-OBJECT:CustomerListBox:SelectedIndexChanged:Subscribe(THIS-OBJECT:CustomerListBox_SelectedIndexChanged).
        THIS-OBJECT:CustomerListBox:DoubleClick:Subscribe(THIS-OBJECT:CustomerListBox_DoubleClick).
        /*  */
        /* SalesRepLabel */
        /*  */
        THIS-OBJECT:SalesRepLabel:Location = NEW System.Drawing.Point(320, 13).
        THIS-OBJECT:SalesRepLabel:Name = "SalesRepLabel".
        THIS-OBJECT:SalesRepLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:SalesRepLabel:TabIndex = 1.
        THIS-OBJECT:SalesRepLabel:Text = "label1".
        THIS-OBJECT:SalesRepLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* SaveButton */
        /*  */
        THIS-OBJECT:SaveButton:Location = NEW System.Drawing.Point(12, 113).
        THIS-OBJECT:SaveButton:Name = "SaveButton".
        THIS-OBJECT:SaveButton:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:SaveButton:TabIndex = 2.
        THIS-OBJECT:SaveButton:Text = "Save".
        THIS-OBJECT:SaveButton:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:SaveButton:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:SaveButton:Click:Subscribe(THIS-OBJECT:Savebutton_Click).
        /*  */
        /* DeleteButton */
        /*  */
        THIS-OBJECT:DeleteButton:Location = NEW System.Drawing.Point(105, 113).
        THIS-OBJECT:DeleteButton:Name = "DeleteButton".
        THIS-OBJECT:DeleteButton:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:DeleteButton:TabIndex = 3.
        THIS-OBJECT:DeleteButton:Text = "Delete".
        THIS-OBJECT:DeleteButton:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:DeleteButton:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:DeleteButton:Click:Subscribe(THIS-OBJECT:DeleteButton_Click).
        /*  */
        /* NameTextBox */
        /*  */
        THIS-OBJECT:NameTextBox:Location = NEW System.Drawing.Point(320, 44).
        THIS-OBJECT:NameTextBox:Name = "NameTextBox".
        THIS-OBJECT:NameTextBox:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:NameTextBox:TabIndex = 4.
        /*  */
        /* OrderDataGridView */
        /*  */
        THIS-OBJECT:OrderDataGridView:AutoGenerateColumns = FALSE.
        THIS-OBJECT:OrderDataGridView:ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode:AutoSize.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar0 AS System.Windows.Forms.DataGridViewColumn EXTENT 8 NO-UNDO.
        arrayvar0[1] = THIS-OBJECT:ordernumDataGridViewTextBoxColumn.
        arrayvar0[2] = THIS-OBJECT:discountDataGridViewTextBoxColumn.
        arrayvar0[3] = THIS-OBJECT:extendedPriceDataGridViewTextBoxColumn.
        arrayvar0[4] = THIS-OBJECT:itemnumDataGridViewTextBoxColumn.
        arrayvar0[5] = THIS-OBJECT:linenumDataGridViewTextBoxColumn.
        arrayvar0[6] = THIS-OBJECT:orderLineStatusDataGridViewTextBoxColumn.
        arrayvar0[7] = THIS-OBJECT:priceDataGridViewTextBoxColumn.
        arrayvar0[8] = THIS-OBJECT:qtyDataGridViewTextBoxColumn.
        THIS-OBJECT:OrderDataGridView:Columns:AddRange(arrayvar0).
        THIS-OBJECT:OrderDataGridView:DataSource = THIS-OBJECT:bindingSource1.
        THIS-OBJECT:OrderDataGridView:ImeMode = System.Windows.Forms.ImeMode:On.
        THIS-OBJECT:OrderDataGridView:Location = NEW System.Drawing.Point(12, 162).
        THIS-OBJECT:OrderDataGridView:Name = "OrderDataGridView".
        THIS-OBJECT:OrderDataGridView:Size = NEW System.Drawing.Size(844, 140).
        THIS-OBJECT:OrderDataGridView:TabIndex = 5.
        THIS-OBJECT:OrderDataGridView:CellContentClick:Subscribe(THIS-OBJECT:OrderDataGridView_CellContentClick).
        THIS-OBJECT:OrderDataGridView:DoubleClick:Subscribe(THIS-OBJECT:OrderDataGridView_DoubleClick).
        /*  */
        /* ordernumDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:ordernumDataGridViewTextBoxColumn:DataPropertyName = "Ordernum".
        THIS-OBJECT:ordernumDataGridViewTextBoxColumn:HeaderText = "Order Num".
        THIS-OBJECT:ordernumDataGridViewTextBoxColumn:Name = "ordernumDataGridViewTextBoxColumn".
        /*  */
        /* discountDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:discountDataGridViewTextBoxColumn:DataPropertyName = "Discount".
        THIS-OBJECT:discountDataGridViewTextBoxColumn:HeaderText = "Discount".
        THIS-OBJECT:discountDataGridViewTextBoxColumn:Name = "discountDataGridViewTextBoxColumn".
        /*  */
        /* extendedPriceDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:extendedPriceDataGridViewTextBoxColumn:DataPropertyName = "ExtendedPrice".
        THIS-OBJECT:extendedPriceDataGridViewTextBoxColumn:HeaderText = "Extended Price".
        THIS-OBJECT:extendedPriceDataGridViewTextBoxColumn:Name = "extendedPriceDataGridViewTextBoxColumn".
        /*  */
        /* itemnumDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:itemnumDataGridViewTextBoxColumn:DataPropertyName = "Itemnum".
        THIS-OBJECT:itemnumDataGridViewTextBoxColumn:HeaderText = "Item Num".
        THIS-OBJECT:itemnumDataGridViewTextBoxColumn:Name = "itemnumDataGridViewTextBoxColumn".
        /*  */
        /* linenumDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:linenumDataGridViewTextBoxColumn:DataPropertyName = "Linenum".
        THIS-OBJECT:linenumDataGridViewTextBoxColumn:HeaderText = "Line Num".
        THIS-OBJECT:linenumDataGridViewTextBoxColumn:Name = "linenumDataGridViewTextBoxColumn".
        /*  */
        /* orderLineStatusDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:orderLineStatusDataGridViewTextBoxColumn:DataPropertyName = "OrderLineStatus".
        THIS-OBJECT:orderLineStatusDataGridViewTextBoxColumn:HeaderText = "Order Line Status".
        THIS-OBJECT:orderLineStatusDataGridViewTextBoxColumn:Name = "orderLineStatusDataGridViewTextBoxColumn".
        /*  */
        /* priceDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:priceDataGridViewTextBoxColumn:DataPropertyName = "Price".
        THIS-OBJECT:priceDataGridViewTextBoxColumn:HeaderText = "Price".
        THIS-OBJECT:priceDataGridViewTextBoxColumn:Name = "priceDataGridViewTextBoxColumn".
        /*  */
        /* qtyDataGridViewTextBoxColumn */
        /*  */
        THIS-OBJECT:qtyDataGridViewTextBoxColumn:DataPropertyName = "Qty".
        THIS-OBJECT:qtyDataGridViewTextBoxColumn:HeaderText = "Qty".
        THIS-OBJECT:qtyDataGridViewTextBoxColumn:Name = "qtyDataGridViewTextBoxColumn".
        /*  */
        /* bindingSource1 */
        /*  */
        THIS-OBJECT:bindingSource1:MaxDataGuess = 0.
        THIS-OBJECT:bindingSource1:NoLOBs = FALSE.
        THIS-OBJECT:bindingSource1:Position = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar1 AS "Progress.Data.TableDesc[]" NO-UNDO.
        arrayvar1 = NEW "Progress.Data.TableDesc[]"(0).
        tableDesc1:ChildTables = arrayvar1.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar2 AS Progress.Data.ColumnPropDesc EXTENT 8 NO-UNDO.
        arrayvar2[1] = NEW Progress.Data.ColumnPropDesc("Discount", "Discount", Progress.Data.DataType:INTEGER).
        arrayvar2[2] = NEW Progress.Data.ColumnPropDesc("ExtendedPrice", "Extended Price", Progress.Data.DataType:DECIMAL).
        arrayvar2[3] = NEW Progress.Data.ColumnPropDesc("Itemnum", "Item Num", Progress.Data.DataType:INTEGER).
        arrayvar2[4] = NEW Progress.Data.ColumnPropDesc("Linenum", "Line Num", Progress.Data.DataType:INTEGER).
        arrayvar2[5] = NEW Progress.Data.ColumnPropDesc("OrderLineStatus", "Order Line Status", Progress.Data.DataType:CHARACTER).
        arrayvar2[6] = NEW Progress.Data.ColumnPropDesc("Ordernum", "Order Num", Progress.Data.DataType:INTEGER).
        arrayvar2[7] = NEW Progress.Data.ColumnPropDesc("Price", "Price", Progress.Data.DataType:DECIMAL).
        arrayvar2[8] = NEW Progress.Data.ColumnPropDesc("Qty", "Qty", Progress.Data.DataType:INTEGER).
        tableDesc1:Columns = arrayvar2.
        THIS-OBJECT:bindingSource1:TableSchema = tableDesc1.
        /*  */
        /* CustomerOrdersBox */
        /*  */
        THIS-OBJECT:CustomerOrdersBox:FormattingEnabled = TRUE.
        THIS-OBJECT:CustomerOrdersBox:Location = NEW System.Drawing.Point(139, 13).
        THIS-OBJECT:CustomerOrdersBox:Name = "CustomerOrdersBox".
        THIS-OBJECT:CustomerOrdersBox:Size = NEW System.Drawing.Size(120, 95).
        THIS-OBJECT:CustomerOrdersBox:TabIndex = 6.
        /*  */
        /* Test */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(970, 402).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:CustomerOrdersBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:OrderDataGridView).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:NameTextBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:DeleteButton).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:SaveButton).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:SalesRepLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:CustomerListBox).
        THIS-OBJECT:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:Name = "Test".
        THIS-OBJECT:Text = "Test".
        CAST(THIS-OBJECT:OrderDataGridView, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID LoadData( ):
        
        for each Customer
        where not can-find (first Order
                                where Order.CustNum = Customer.CustNum)
        and not can-find (first Invoice
                                where Invoice.CustNum = Customer.CustNum)
            no-lock:           
            
            CustomerListBox:Items:Add(Customer.Name).
            
                if not can-find ( bCustomer
                                   where  bCustomer.CustNum = Customer.CustNum) then
                do:
                    create bCustomer.
                    BUFFER-COPY Customer to bCustomer.
                end.
            end.
        RETURN.

    END METHOD.
    METHOD PUBLIC VOID LoadData( input test as character ):
/*        MESSAGE test      */
/*        VIEW-AS ALERT-BOX.*/
/*        CustomerOrdersBox */
        for each Customer
/*        where Customer.Name = 'Lift Tours'*/
/*            and Customer.CreditLimit > 0*/
            no-lock:

            CustomerListBox:Items:Add(Customer.Name).

                if not can-find ( bCustomer
                                   where  bCustomer.CustNum = Customer.CustNum) then
                do:
                create bCustomer.
                BUFFER-COPY Customer to bCustomer.
                end.

               
            end.
        RETURN.

    END METHOD.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID OrderDataGridView_CellContentClick( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.DataGridViewCellEventArgs ):
		
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID OrderDataGridView_DoubleClick( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
		define variable OrderFormVar as OrderForm no-undo.
		OrderFormVar = NEW OrderForm().
		wait-for OrderFormVar:showdialog().
		
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID SaveButton_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
		find Customer
           where Customer.Name = string(CustomerListBox:SelectedItem)
           exclusive-lock.
        
        Customer.Name = NameTextBox:Text.
        
        CustomerListBox:Items:Clear().
        
        LoadData().
        
		RETURN.

	END METHOD.

    DESTRUCTOR PUBLIC Test ( ):

    END DESTRUCTOR.

END CLASS.