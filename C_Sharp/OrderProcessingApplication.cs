namespace OrderProcessingApplication
{
    public delegate void OrderProcessedHandler(Order order);

    public class Order
    {
        public int OrderID { get; set; }
        public string CustomerEmail { get; set; } = string.Empty;
        public decimal Amount { get; set; }
    }

    public class OrderProcessor
    {
        public event OrderProcessedHandler? OrderProcessed;

        public void ProcessOrder(Order order)
        {
            Console.WriteLine($"Processing Order #{order.OrderID}");
            //Simulate Processing
            Thread.Sleep(1000);
            Console.WriteLine("Order Processed Successfully");
            //Raise Event
            OnOrderProcessed(order);
        }

        protected virtual void OnOrderProcessed(Order order)
        {
            OrderProcessed?.Invoke(order);
        }
    }

    public class EmailService
    {
        public void SentEmail(Order order)
        {
            Console.WriteLine($"Email Sent to {order.CustomerEmail}");
        }
    }

    public class SmsService
    {
        public void SendSms(Order order)
        {
            Console.WriteLine($"SMS Sent for Order # {order.OrderID}");
        }
    }

    public class BillingService
    {
        public void GenerateInvoice(Order order)
        {
            Console.WriteLine($"Invoice Generated for Order # {order.OrderID}");
        }
    }

    public class LoggerService
    {
        public void Log(Order order)
        {
            Console.WriteLine($"Order # {order.OrderID} Logged.");
        }
    }

    internal class Program
    {
        static void Main(string[] args)
        {
            var processor = new OrderProcessor();
            var Email = new EmailService();
            var sms = new SmsService();
            var Billing = new BillingService();
            var Logger = new LoggerService();
            processor.OrderProcessed += Email.SentEmail;
            processor.OrderProcessed += sms.SendSms;
            processor.OrderProcessed += Billing.GenerateInvoice;
            processor.OrderProcessed += Logger.Log;
            var order = new Order
            {
                OrderID = 1101,
                CustomerEmail = "Customer@email.com",
                Amount = 4000,
            };
            processor.ProcessOrder(order);
            Console.ReadKey();
        }
    }
}
