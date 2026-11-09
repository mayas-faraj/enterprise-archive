using System.Security.Cryptography;
using System.Text;
namespace TurksistService;

public class Worker : BackgroundService
{
    private readonly ILogger<Worker> _logger;

    public Worker(ILogger<Worker> logger)
    {
        _logger = logger;
        runServer();
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while(!stoppingToken.IsCancellationRequested)
        {
            _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);
            await Task.Delay(3000, stoppingToken);
        }
    }


    private async void runServer()
    {
        string key = File.ReadAllText(System.AppContext.BaseDirectory + "/dp.enc");
        string data = decrypt(key, "E-11m3kg-1s-2");
        string server = data.Substring(0, data.IndexOf('?'));
        string user = data.Substring(data.IndexOf('?') + 1,  data.IndexOf(':') - data.IndexOf('?')-1);
        string password = data.Substring(data.IndexOf(':') + 1);
           
        Database db=new Database(server, user, password);
    
        var builder = WebApplication.CreateBuilder();
        builder.WebHost
        .UseKestrel()
        .ConfigureKestrel((serverOptions)=>
        {
            serverOptions.Listen(System.Net.IPAddress.Any, 3000);
        });
        var app = builder.Build();
        app.MapGet("/", () => "Service is running!");
        app.MapGet("/{table}", (string table) => db.Query(table));
        app.MapGet("/{table}/{field}", (string table, string field, string value) => db.Query(table, field));
        app.MapGet("/{table}/{field}/{value}", (string table, string field, string value) => db.Query(table, field, value));
        app.MapGet("/{table}/{field}/{fromValue}/{toValue}", (string table, string field, string fromValue, string toValue) => db.Query(table, field, fromValue, toValue));
        await app.RunAsync();
    }

    private string decrypt(string cipher, string salt)
    {
        byte[] cipherBytes = Convert.FromBase64String(cipher);
        byte[] saltBytes = Encoding.UTF8.GetBytes(salt);
        byte[] passwordBytes = ProtectedData.Unprotect(cipherBytes, null, DataProtectionScope.LocalMachine);
        return Encoding.UTF8.GetString(passwordBytes);
    }

    private bool isServerRunning;
}