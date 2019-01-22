using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Kyle Duncan
public class WeaponSelect : MonoBehaviour
{
    public GameObject weapon1;
    public GameObject weapon2;
    public GameObject weapon3;
    static private bool weapon1Pickup = false;
    static private bool weapon2Pickup = false;
    static private bool weapon3Pickup = false;

    static List<GameObject> Weapons;


    public void Awake()
    {
        Weapons = new List<GameObject>();
        Weapons.Add(weapon1);
        Weapons.Add(weapon2);
        Weapons.Add(weapon3);
        Weapons[0].SetActive(false);
        Weapons[1].SetActive(false);
        Weapons[2].SetActive(false);

    }

    public static void addWeapon(string name)
    {
        Debug.Log(name);
        if (name == "Weapon1Pickup(Clone)")
        {
            Weapons[0].SetActive(true);
            weapon1Pickup = true;
        }
        if (name == "Weapon2Pickup(Clone)")
        {
            Weapons[1].SetActive(true);
            weapon2Pickup = true;
        }

        if (name == "Weapon3Pickup(Clone)")
        {
            Weapons[2].SetActive(true);
            weapon3Pickup = true;
        }
    }


    public void SwitchWeapons(int w)
    {
        if (w == 1 && weapon1Pickup == true)
        {
            Weapons[0].SetActive(true);
            Weapons[1].SetActive(false);
            Weapons[2].SetActive(false);
        }
        else if (w == 2 && weapon2Pickup == true)
        {
            Weapons[0].SetActive(false);
            Weapons[1].SetActive(true);
            Weapons[2].SetActive(false);
        }
        else if (w == 3 && weapon3Pickup == true)
        {
            Weapons[0].SetActive(true);
            Weapons[1].SetActive(false);
            Weapons[2].SetActive(true);
        }
    }
}