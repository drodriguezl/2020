package com.example.goeatnow

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import com.example.goeatnow.ProviderType.BASIC
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.auth.FirebaseAuth
import kotlinx.android.synthetic.main.activity_main.*
import kotlin.math.sign

class mainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val analytics:FirebaseAnalytics =  FirebaseAnalytics.getInstance(this)
        val bundle = Bundle()
        bundle.putString("message", "Integración de Firebase completa")
        analytics.logEvent("InitScreen", bundle)

        //Setup
        setup()
    }
    private fun setup(){

        title = "Authentication"
        signUpBotton.setOnClickListener{
            if(emailEditText.text.isNotEmpty() && paswordEditText.text.isNotEmpty()){
                FirebaseAuth.getInstance().createUserWithEmailAndPassword(emailEditText.text.toString(),
                    paswordEditText.text.toString()).addOnCompleteListener{

                    if (it.isSuccessful){
                        showHome(it.result?.user?.email ?: "", BASIC)
                    }else{
                        showAlert()
                    }
                }
            }
        }
        loginButton.setOnClickListener{
            if (emailEditText.text.isNotEmpty() && paswordEditText.text.isNotEmpty()){

                FirebaseAuth.getInstance().signInWithEmailAndPassword(emailEditText.text.toString(),
                    paswordEditText.text.toString()).addOnCompleteListener{

                    if (it.isSuccessful){
                        showHome(it.result?.user?.email ?: "", BASIC)
                    }else{
                        showAlert()
                    }
                }
            }
        }

    }

    private fun showAlert(){

        val builder = AlertDialog.Builder(this)
        builder.setTitle("error")
        builder.setMessage("Se ha producido un error autenticando al usuario")
        builder.setPositiveButton("Aceptar", null)
        val dialog: AlertDialog = builder.create()
        dialog.show()
    }

    private fun showHome(email: String, provider: ProviderType){

        val homeIntent = Intent (this, HomeActivity::class.java).apply {
            putExtra("email", email)
            putExtra("provider", provider.name)
        }
        startActivity(homeIntent)
    }
}
