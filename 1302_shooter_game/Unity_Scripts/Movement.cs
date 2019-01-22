using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
//Kyle Duncan && Tyler Hocker
public class Movement : MonoBehaviour
{
    public float speed = 10f;
    public float turnSpeed = 120f;
    public AudioSource deathSource;
    public AudioClip deathClip;

    private Rigidbody rb;
    private float movementInput;
    private float turnInput;
    private WeaponSelect weapons;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        weapons = GetComponent<WeaponSelect>();
    }


    private void OnEnable()
    {
        rb.isKinematic = false;
        movementInput = 0f;
        turnInput = 0f;
    }

    private void OnDisable()
    {
        rb.isKinematic = true;
    }
	
	// Update is called once per frame
	void Update ()
    {
        movementInput = Input.GetAxis("Horizontal");
        turnInput = Input.GetAxis("Vertical");
        Move();
        Turn();
        CheckForWeaponSelect();
    }

    private void FixedUpdate()
    {
    }

    private void Move()
    {
        Vector3 movement = transform.forward * movementInput * speed * Time.deltaTime;
        rb.MovePosition(rb.position + movement);
    }

    private void Turn()
    {
        float turn = turnInput * turnSpeed * Time.deltaTime;
        Quaternion tRotation = Quaternion.Euler(0f, turn, 0);
        rb.MoveRotation(rb.rotation * tRotation);
    }

    private void CheckForWeaponSelect()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
        { weapons.SwitchWeapons(1); }

        else if (Input.GetKeyDown(KeyCode.Alpha2))
        { weapons.SwitchWeapons(2); }

        else if (Input.GetKeyDown(KeyCode.Alpha3))
        { weapons.SwitchWeapons(3); }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("EnemyBullet") || other.CompareTag("Wall"))
        {
            AudioSource.PlayClipAtPoint(deathClip, this.transform.position);
            SceneManager.LoadScene("CSE1302_Project 1");            
        }

    }
}
