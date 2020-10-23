function itemPrice() {
  // 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value; // inputValue:価格
  (inputValue);
  const addTaxDom = document.getElementById("add-tax-price") // addTaxDom:販売手数料
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  (addTaxDom);
  const profitNumber = document.getElementById("profit") // profitNumber:販売利益
  const valueResult = inputValue * 0.1
  profitNumber.innerHTML = (Math.floor(inputValue - valueResult));
  (profitNumber);
})
};
window.addEventListener('load', itemPrice)