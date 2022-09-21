GO
CREATE TRIGGER trg_Order on tblOrderDetail AFTER INSERT AS
BEGIN
	UPDATE tblProduct
	SET quantity = tblProduct.quantity - (
		SELECT quantity
		FROM inserted
		WHERE productID = tblProduct.productID
	)
	FROM tblProduct
	JOIN inserted ON tblProduct.productID = inserted.productID
END

GO
CREATE TRIGGER trg_CancelOrder on tblOrderDetail FOR DELETE AS
BEGIN
	UPDATE tblProduct
	SET quantity = tblProduct.quantity + (
		SELECT quantity
		FROM deleted
		WHERE productID = tblProduct.productID
	)
	FROM tblProduct
	JOIN deleted ON tblProduct.productID = deleted.productID
END


