<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Admission - Fortune Cloud Team</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: #333;
        }
        
        .container {
            width: 100%;
            max-width: 900px;
            display: flex;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            border-radius: 20px;
            overflow: hidden;
            animation: fadeIn 1s ease-out;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .welcome-section {
            flex: 1;
            background: linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
            color: white;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        .welcome-section::before {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            top: -50px;
            left: -50px;
        }
        
        .welcome-section::after {
            content: '';
            position: absolute;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            bottom: -50px;
            right: -50px;
        }
        
        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            animation: slideInLeft 1s ease-out;
        }
        
        .logo i {
            font-size: 2.5rem;
            margin-right: 15px;
        }
        
        .logo h1 {
            font-size: 1.8rem;
            font-weight: 700;
        }
        
        .welcome-text {
            margin-bottom: 30px;
            animation: slideInLeft 1.2s ease-out;
        }
        
        .welcome-text h2 {
            font-size: 2.2rem;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .welcome-text p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .features {
            list-style: none;
            animation: slideInLeft 1.4s ease-out;
        }
        
        .features li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        
        .features i {
            margin-right: 10px;
            background: rgba(255, 255, 255, 0.2);
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        .form-section {
            flex: 1.2;
            background: white;
            padding: 40px;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
            animation: fadeIn 1s ease-out;
        }
        
        .form-header h2 {
            color: #2575fc;
            font-size: 1.8rem;
            margin-bottom: 10px;
        }
        
        .form-header p {
            color: #666;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
            animation: formFieldAppear 0.5s ease-out forwards;
            opacity: 0;
            transform: translateY(10px);
        }
        
        @keyframes formFieldAppear {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .form-group:nth-child(1) {
            animation-delay: 0.2s;
        }
        
        .form-group:nth-child(2) {
            animation-delay: 0.3s;
        }
        
        .form-group:nth-child(3) {
            animation-delay: 0.4s;
        }
        
        .form-group:nth-child(4) {
            animation-delay: 0.5s;
        }
        
        .form-group:nth-child(5) {
            animation-delay: 0.6s;
        }
        
        .form-group:nth-child(6) {
            animation-delay: 0.7s;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #444;
            transition: color 0.3s;
        }
        
        .input-container {
            position: relative;
        }
        
        .input-container i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            transition: color 0.3s;
        }
        
        input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #e1e5ee;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s;
            outline: none;
        }
        
        input:focus {
            border-color: #2575fc;
            box-shadow: 0 0 0 3px rgba(37, 117, 252, 0.1);
        }
        
        input:focus+i {
            color: #2575fc;
        }
        
        .submit-btn {
            background: linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(37, 117, 252, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(37, 117, 252, 0.4);
        }
        
        .submit-btn:active {
            transform: translateY(0);
        }
        
        .submit-btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%);
            transform-origin: 50% 50%;
        }
        
        .submit-btn:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }
        
        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 0.5;
            }
            100% {
                transform: scale(20, 20);
                opacity: 0;
            }
        }
        
        .form-footer {
            text-align: center;
            margin-top: 20px;
            color: #666;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            .welcome-section,
            .form-section {
                padding: 30px;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="welcome-section">
            <div class="logo">
                <i class="fas fa-cloud"></i>
                <h1>Fortune Cloud Team</h1>
            </div>
            <div class="welcome-text">
                <h2>Welcome to Our Academy!</h2>
                <p>Join thousands of successful students who have transformed their careers with our programs.</p>
            </div>
            <ul class="features">
                <li><i class="fas fa-check"></i> Industry-Relevant Curriculum</li>
                <li><i class="fas fa-check"></i> Expert Faculty Members</li>
                <li><i class="fas fa-check"></i> Career Support Services</li>
                <li><i class="fas fa-check"></i> Modern Learning Facilities</li>
            </ul>
        </div>

        <div class="form-section">
            <div class="form-header">
                <h2>Student Admission Form</h2>
                <p>Please fill in your details accurately</p>
            </div>

            <form action="registrationController" method="post">
                <div class="form-group">
                    <label for="fullname">Student Name</label>
                    <div class="input-container">
                        <input type="text" id="fullname" name="fullname" required>
                        <i class="fas fa-user"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Student Address</label>
                    <div class="input-container">
                        <input type="text" id="address" name="address" required>
                        <i class="fas fa-home"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="age">Student Age</label>
                    <div class="input-container">
                        <input type="number" id="age" name="age" min="16" max="40" required>
                        <i class="fas fa-birthday-cake"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="qual">Student Qualification</label>
                    <div class="input-container">
                        <input type="text" id="qual" name="qual" required>
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="percent">Student Percentage</label>
                    <div class="input-container">
                        <input type="number" id="percent" name="percent" min="0" max="100" step="0.01" required>
                        <i class="fas fa-percentage"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="yop">Year Passed</label>
                    <div class="input-container">
                        <input type="number" id="yop" name="yop" min="2000" max="2023" required>
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                </div>

                <button type="submit" class="submit-btn">
                    <i class="fas fa-user-plus"></i> Submit Application
                </button>
            </form>

            <div class="form-footer">
                <p>Your information is secure and will only be used for admission purposes.</p>
            </div>
        </div>
    </div>

    <script>
        // Add focus effects to form inputs
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.parentElement.querySelector('label').style.color = '#2575fc';
            });

            input.addEventListener('blur', function() {
                this.parentElement.parentElement.querySelector('label').style.color = '#444';
            });
        });

        // Form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            let isValid = true;
            const inputs = document.querySelectorAll('input[required]');

            inputs.forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                    input.style.borderColor = 'red';
                } else {
                    input.style.borderColor = '#e1e5ee';
                }
            });

            if (!isValid) {
                e.preventDefault();
                alert('Please fill in all required fields.');
            }
        });
    </script>
</body>

</html>