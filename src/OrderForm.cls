 
 /*------------------------------------------------------------------------
    File        : OrderForm
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Arnoldas
    Created     : Tue Feb 08 13:24:22 EET 2022
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OrderForm INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE DiscountLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE QuantityLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE SaveButton AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE QuantityTextBox AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE PriceTextBox AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE PriceLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE OrderLineNumberTextBox AS System.Windows.Forms.TextBox NO-UNDO.
    DEFINE PRIVATE VARIABLE OrderLineNumberLabel AS System.Windows.Forms.Label NO-UNDO.
    DEFINE PRIVATE VARIABLE DiscountTextBox AS System.Windows.Forms.TextBox NO-UNDO.

        
    CONSTRUCTOR PUBLIC OrderForm (  ):
        
        
        SUPER().
        InitializeComponent().
        THIS-OBJECT:ComponentsCollection:ADD(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:SaveButton = NEW System.Windows.Forms.Button().
        THIS-OBJECT:OrderLineNumberTextBox = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:PriceTextBox = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:QuantityTextBox = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:DiscountTextBox = NEW System.Windows.Forms.TextBox().
        THIS-OBJECT:OrderLineNumberLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:PriceLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:QuantityLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:DiscountLabel = NEW System.Windows.Forms.Label().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* SaveButton */
        /*  */
        THIS-OBJECT:SaveButton:Location = NEW System.Drawing.Point(27, 129).
        THIS-OBJECT:SaveButton:Name = "SaveButton".
        THIS-OBJECT:SaveButton:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:SaveButton:TabIndex = 0.
        THIS-OBJECT:SaveButton:Text = "SaveB".
        THIS-OBJECT:SaveButton:UseCompatibleTextRendering = TRUE.
        THIS-OBJECT:SaveButton:UseVisualStyleBackColor = TRUE.
        THIS-OBJECT:SaveButton:Click:Subscribe(THIS-OBJECT:SaveButton_Click).
        /*  */
        /* OrderLineNumberTextBox */
        /*  */
        THIS-OBJECT:OrderLineNumberTextBox:Location = NEW System.Drawing.Point(27, 13).
        THIS-OBJECT:OrderLineNumberTextBox:Name = "OrderLineNumberTextBox".
        THIS-OBJECT:OrderLineNumberTextBox:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:OrderLineNumberTextBox:TabIndex = 1.
        THIS-OBJECT:OrderLineNumberTextBox:TextChanged:Subscribe(THIS-OBJECT:OrderLineNumberTextBox_TextChanged).
        /*  */
        /* PriceTextBox */
        /*  */
        THIS-OBJECT:PriceTextBox:Location = NEW System.Drawing.Point(27, 39).
        THIS-OBJECT:PriceTextBox:Name = "PriceTextBox".
        THIS-OBJECT:PriceTextBox:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:PriceTextBox:TabIndex = 2.
        /*  */
        /* QuantityTextBox */
        /*  */
        THIS-OBJECT:QuantityTextBox:Location = NEW System.Drawing.Point(27, 66).
        THIS-OBJECT:QuantityTextBox:Name = "QuantityTextBox".
        THIS-OBJECT:QuantityTextBox:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:QuantityTextBox:TabIndex = 3.
        /*  */
        /* DiscountTextBox */
        /*  */
        THIS-OBJECT:DiscountTextBox:Location = NEW System.Drawing.Point(27, 93).
        THIS-OBJECT:DiscountTextBox:Name = "DiscountTextBox".
        THIS-OBJECT:DiscountTextBox:Size = NEW System.Drawing.Size(100, 20).
        THIS-OBJECT:DiscountTextBox:TabIndex = 4.
        /*  */
        /* OrderLineNumberLabel */
        /*  */
        THIS-OBJECT:OrderLineNumberLabel:Location = NEW System.Drawing.Point(146, 13).
        THIS-OBJECT:OrderLineNumberLabel:Name = "OrderLineNumberLabel".
        THIS-OBJECT:OrderLineNumberLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:OrderLineNumberLabel:TabIndex = 5.
        THIS-OBJECT:OrderLineNumberLabel:Text = "OrderLine Number".
        THIS-OBJECT:OrderLineNumberLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* PriceLabel */
        /*  */
        THIS-OBJECT:PriceLabel:Location = NEW System.Drawing.Point(146, 40).
        THIS-OBJECT:PriceLabel:Name = "PriceLabel".
        THIS-OBJECT:PriceLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:PriceLabel:TabIndex = 6.
        THIS-OBJECT:PriceLabel:Text = "Price".
        THIS-OBJECT:PriceLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* QuantityLabel */
        /*  */
        THIS-OBJECT:QuantityLabel:Location = NEW System.Drawing.Point(146, 62).
        THIS-OBJECT:QuantityLabel:Name = "QuantityLabel".
        THIS-OBJECT:QuantityLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:QuantityLabel:TabIndex = 7.
        THIS-OBJECT:QuantityLabel:Text = "Quantity".
        THIS-OBJECT:QuantityLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* DiscountLabel */
        /*  */
        THIS-OBJECT:DiscountLabel:Location = NEW System.Drawing.Point(146, 89).
        THIS-OBJECT:DiscountLabel:Name = "DiscountLabel".
        THIS-OBJECT:DiscountLabel:Size = NEW System.Drawing.Size(100, 23).
        THIS-OBJECT:DiscountLabel:TabIndex = 8.
        THIS-OBJECT:DiscountLabel:Text = "Discount".
        THIS-OBJECT:DiscountLabel:UseCompatibleTextRendering = TRUE.
        /*  */
        /* OrderForm */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(292, 266).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:DiscountLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:QuantityLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:PriceLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:OrderLineNumberLabel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:DiscountTextBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:QuantityTextBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:PriceTextBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:OrderLineNumberTextBox).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:SaveButton).
        THIS-OBJECT:Name = "OrderForm".
        THIS-OBJECT:Text = "OrderForm".
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
	@VisualDesigner.
	METHOD PRIVATE VOID OrderLineNumberTextBox_TextChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID SaveButton_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
/*	    find OrderLine                                                  */
/*           where Customer.Name = string(CustomerListBox:SelectedItem)*/
/*           exclusive-lock.                                           */
/*                                                                     */
/*        OrderLine.Linenum = OrderLineNumberTextBox:Text.             */
/*                                                                     */
/*        OrderLineNumberTextBox:Items:Clear().                        */
/*                                                                     */
/*        LoadData().                                                  */
/*                                                                     */
        
/*		RETURN.*/

	END METHOD.

    DESTRUCTOR PUBLIC OrderForm ( ):

    END DESTRUCTOR.

END CLASS.